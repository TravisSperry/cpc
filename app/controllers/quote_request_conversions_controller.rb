# frozen_string_literal: true

class QuoteRequestConversionsController < ApplicationController
  before_action :authenticate_user!

  def create
    work_order = CPC::QuoteRequestConverter.convert(quote_request)
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
