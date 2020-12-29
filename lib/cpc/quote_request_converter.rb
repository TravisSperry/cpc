# frozen_string_literal: true

module Cpc
  class QuoteRequestConverter
    def self.convert(quote_request)
      new.convert(quote_request)
    end

    def convert(quote_request)
      WorkOrder.create! quote_request: quote_request
    end
  end
end
