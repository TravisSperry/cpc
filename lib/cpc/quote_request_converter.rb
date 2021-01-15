# frozen_string_literal: true

module Cpc
  class QuoteRequestConverter
    def self.convert!(quote_request)
      new.convert!(quote_request)
    end

    def convert!(quote_request)
      ActiveRecord::Base.transaction do
        quote_request.update!(status: 'Won')
        WorkOrder.create! quote_request: quote_request, customer: quote_request.customer
      end
    end
  end
end
