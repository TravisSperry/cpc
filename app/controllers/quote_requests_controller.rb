class QuoteRequestsController < ApplicationController

  before_filter :authenticate_user!, except: [:new, :create]

  # GET /quotes
  # GET /quotes.json
  def index
    @quote_requests = QuoteRequest.all

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
    @quote_request = QuoteRequest.new(params[:quote_request])

    respond_to do |format|
      if @quote_request.save
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
end
