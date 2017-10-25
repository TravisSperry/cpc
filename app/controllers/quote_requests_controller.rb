class QuoteRequestsController < ApplicationController

  before_filter :authenticate_user!, except: [:new, :create]

  # GET /quotes
  # GET /quotes.json
  def index
    @active_quote_requests = QuoteRequest.where("status = ? OR status = ? OR status = ?", "New", "Viewed", "Submitted")
    @quote_requests = QuoteRequest.order("created_at DESC").all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @quotes }
    end
  end

  # GET /quotes/1
  # GET /quotes/1.json
  def show
    @quote_request = QuoteRequest.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @quote }
    end
  end

  # GET /quotes/new
  # GET /quotes/new.json
  def new
    @quote_request = QuoteRequest.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @quote_request }
    end
  end

  # GET /quotes/1/edit
  def edit
    @quote_request = QuoteRequest.find(params[:id])
  end

  # POST /quotes
  # POST /quotes.json
  def create
    @quote_request = QuoteRequest.new(quote_request_params)

    respond_to do |format|
      if (verify_recaptcha(model: @quote_request) || Rails.env.development?) && @quote_request.save
        if params[:quote_request_attachments]
          params[:quote_request_attachments]['attachment'].each do |a|
            @quote_request_attachment = @quote_request.quote_request_attachments.create!(:attachment => a)
          end
        end
        NotificationMailer.new_quote(@quote_request).deliver
        # Redirect to thank you page with request_type in params
        format.html { redirect_to static_pages_thank_you_url(request_type: "quote"), notice: 'Request received. We will contact you shortly.' }
        format.json { render json: @quote_request, status: :created, location: @quote_request }
      else
        flash[:error] = "Please verify that you are not a robot by checking the checkbox below." unless verify_recaptcha(model: @quote_request)
        format.html { render action: "new" }
        format.json { render json: @quote_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /quotes/1
  # PUT /quotes/1.json
  def update
    @quote_request = QuoteRequest.find(params[:id])

    respond_to do |format|
      if @quote_request.update_attributes(params[:quote_request])
        format.html { redirect_to @quote_request, notice: 'RFQ was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @quote_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /quotes/1
  # DELETE /quotes/1.json
  def destroy
    @quote_request = QuoteRequest.find(params[:id])
    @quote_request.destroy

    respond_to do |format|
      format.html { redirect_to quote_requests_url }
      format.json { head :no_content }
    end
  end

  def calculator
    @powder_costs = { stock: 8.5, exotic: 12.5, custom: 16.5 }
    @oven_sizes = { small: 20, large: 45 }
  end

  def mark_as_viewed
    @quote_request = QuoteRequest.find(params[:id])

    @quote_request.update_attribute :status, "Viewed"

    redirect_to quote_requests_url, notice: "Quote request has been marked as viewed."
  end

  def mark_as_submitted
    @quote_request = QuoteRequest.find(params[:id])

    @quote_request.update_attribute :status, "Submitted"

    redirect_to quote_requests_url, notice: "Quote request has been marked as submitted."
  end

  def mark_as_won
    @quote_request = QuoteRequest.find(params[:id])

    @quote_request.update_attribute :status, "Won"

    redirect_to quote_requests_url, notice: "Quote request has been marked as won."
  end

  def mark_as_lost
    @quote_request = QuoteRequest.find(params[:id])

    @quote_request.update_attribute :status, "Lost"

    redirect_to quote_requests_url, notice: "Quote request has been marked as lost."
  end

  private
    # Using a private method to encapsulate the permissible parameters
    # is just a good pattern since you'll be able to reuse the same
    # permit list between create and update. Also, you can specialize
    # this method with per-user checking of permissible attributes.
    def quote_request_params
      params.require(:quote_request).permit(:address_1, :address_2, :city, :coating_requirements, :company_name, :email, :fax, :first_name, :job_title, :last_name, :masking_requirements, :note, :packaging_requirements, :paint_specs, :part_description, :part_number, :part_size, :powder_color, :powder_product_code, :powder_product_manufacturer, :quantity_run, :quantity_year, :state, :substrate, :telephone, :zip, :status, :user_id, :source, quote_request_attachments_attributes: [:id, :quote_request_id, :attachment])
    end
end
