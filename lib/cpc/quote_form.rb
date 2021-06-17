# frozen_string_literal: true

module Cpc
  class QuoteForm
    attr_accessor :quote
    attr_reader :quote_request

    LABOR_RATE = 130

    def initialize(quote_request)
      @quote_request = quote_request
      @quote = Quote.new
    end

    def powder_costs
      [['Exotic ($18.75/lb.)', 18.75], ['Custom ($31.50/lb.)', 31.50]]
    end

    def oven_sizes
      { small: 35, large: 70 }
    end

    def labor_rate
      LABOR_RATE
    end
  end
end
