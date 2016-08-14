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
      if verify_recaptcha(model: @quote_request) && @quote_request.save
        if params[:quote_request_attachments]
          params[:quote_request_attachments]['attachment'].each do |a|
            @quote_request_attachment = @quote_request.quote_request_attachments.create!(:attachment => a)
          end
        end
        NotificationMailer.new_quote(@quote_request).deliver
        format.html { redirect_to root_url, notice: 'Request received. We will contact you shortly.' }
        format.json { render json: @quote_request, status: :created, location: @quote_request }
      else
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

  private
    # Using a private method to encapsulate the permissible parameters
    # is just a good pattern since you'll be able to reuse the same
    # permit list between create and update. Also, you can specialize
    # this method with per-user checking of permissible attributes.
    def quote_request_params
      params.require(:quote_request).permit(:address_1, :address_2, :city, :coating_requirements, :company_name, :email, :fax, :first_name, :job_title, :last_name, :masking_requirements, :note, :packaging_requirements, :paint_specs, :part_description, :part_number, :part_size, :powder_color, :powder_product_code, :powder_product_manufacturer, :quantity_run, :quantity_year, :state, :substrate, :telephone, :zip, :status, :user_id, quote_request_attachments_attributes: [:id, :quote_request_id, :attachment])
    end
end
