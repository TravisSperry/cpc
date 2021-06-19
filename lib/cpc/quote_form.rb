# frozen_string_literal: true

module Cpc
  class QuoteForm
    attr_accessor :quote
    attr_reader :quote_request

    LABOR_RATE = 130
    COST_OF_BUSINESS_MULTIPLIERS = [0.05, 0.1, 0.15, 0.2, 0.25, 0.3, 0.35, 0.4, 0.45]
    MARGIN_MULTIPLIERS = [0.40, 0.48, 0.55, 0.62, 0.75]
    SANDBLASTING_RATE = 100
    SANDBLASTING_MEDIA_MULTIPLIER = 0.125

    def initialize(quote_request, quote)
      @quote_request = quote_request
      @quote = quote || Quote.new
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

    def sandblasting_rate
      SANDBLASTING_RATE
    end

    def sandblasting_media_multiplier
      SANDBLASTING_MEDIA_MULTIPLIER
    end

    def cost_of_business_ticks
      (0...Cpc::QuoteForm::COST_OF_BUSINESS_MULTIPLIERS.length).to_a
    end

    def cost_of_business_labels
      "[\"IGT\", \"\", \"\", \"\", \"ITIGT\", \"\", \"\", \"\", \"IDHAFC\"]"
    end

    def cost_of_business_slider_location
      Cpc::QuoteForm::COST_OF_BUSINESS_MULTIPLIERS.index(quote.cost_of_business) ||
        0
    end

    def margin_ticks
      (0...Cpc::QuoteForm::MARGIN_MULTIPLIERS.length).to_a
    end

    def margin_labels
      "[\"A\", \"B\", \"C\", \"R\", \"F\"]"
    end

    def margin_slider_location
      Cpc::QuoteForm::MARGIN_MULTIPLIERS.index(quote.pricing_scale) ||
        0
    end
  end
end
