FactoryBot.define do
  factory :quote do
    quote_request { nil }
    labor_hours { rand(1.00..10.00).round(2) }
    labor_rate { Cpc::QuoteForm::LABOR_RATE }
    oven_hours { rand(1.00..10.00).round(2) }
    hourly_oven_price { rand(0.01..1.00).round(2) }
    powder_pounds { rand(1.00..10.00).round(2) }
    powder_price { Cpc::QuoteForm::POWDER_PRICES.sample[1] }
    cost_of_business { rand(0.01..1.00).round(2) }
    pricing_scale { rand(0.01..1.00).round(2) }
    sandblasting_rate { Cpc::QuoteForm::SANDBLASTING_RATE }
    sandblasting_hours { rand(1.00..10.00).round(2) }
    sandblasting_media_multiplier { Cpc::QuoteForm::SANDBLASTING_MEDIA_MULTIPLIER }
    user { nil }
  end
end
