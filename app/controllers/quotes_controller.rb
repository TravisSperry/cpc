# frozen_string_literal: true

class QuotesController < ApplicationController
  before_action :authenticate_user!, except: %i[new create]

  # GET /quotes
  # GET /quotes.json
  def index
    @quotes = Quote.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @quotes }
    end
  end

  # GET /quotes/1
  # GET /quotes/1.json
  def show
    @quote = Quote.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @quote }
    end
  end

  # GET /quotes/new
  # GET /quotes/new.json
  def new
    @quote_form = Cpc::QuoteForm.new(quote_request, nil)

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @quote }
    end
  end

  # GET /quotes/1/edit
  def edit
    @quote_form = Cpc::QuoteForm.new(quote_request, quote)
  end

  # POST /quotes
  # POST /quotes.json
  def create
    @quote = Quote.new(quote_params.merge(quote_request_id: params[:quote_request_id]))

    respond_to do |format|
      if @quote.save
        # NotificationMailer.new_quote(@quote).deliver
        format.html do
          redirect_to quote_request_quote_path(quote_request, @quote), 
                      notice: 'Quote saved'
        end
      else
        format.html { render action: 'new' }
      end
    end
  end

  # PUT /quotes/1
  # PUT /quotes/1.json
  def update
    @quote = Quote.find(params[:id])

    respond_to do |format|
      if @quote.update_attributes(quote_params)
        format.html do
          redirect_to quote_request_quote_path(quote_request, @quote),
                      notice: 'Quote was successfully updated.'
        end
      else
        format.html { render action: 'edit' }
      end
    end
  end

  # DELETE /quotes/1
  # DELETE /quotes/1.json
  def destroy
    @quote = Quote.find(params[:id])
    @quote.destroy

    respond_to do |format|
      format.html { redirect_to quotes_url }
      format.json { head :no_content }
    end
  end

  def quote
    Quote.find(params[:id])
  end

  def quote_request
    QuoteRequest.find(params[:quote_request_id])
  end

  def quote_params
    params.require(:quote).permit(:labor_hours, :oven_hours, :hourly_oven_price, :powder_pounds, :powder_price, :sandblasting_rate, :sandblasting_hours, :cost_of_business, :pricing_scale, :labor_rate, :sandblasting_media_multiplier)
  end
end
