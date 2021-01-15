# frozen_string_literal: true

class QuoteRequestConversionsController < ApplicationController
  before_action :authenticate_user!

  rescue_from ActiveRecord::RecordInvalid do
    flash[:error] = 'Must have customer associated to quote request to convert to work order'
    redirect_to quote_request
  end

  def create
    work_order = ::Cpc::QuoteRequestConverter.convert!(quote_request)
    redirect_to work_order
  end

  private

  def quote_request
    QuoteRequest.find(quote_request_id)
  end

  def quote_request_id
    params.require(:quote_request_id)
  end
end
