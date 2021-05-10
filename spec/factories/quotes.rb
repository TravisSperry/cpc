FactoryBot.define do
  factory :quote do
    quote_request { nil }
    labor_hours { "9.99" }
    oven_hours { "9.99" }
    powder_pounds { "9.99" }
    cost_of_business { 1 }
    pricing_scale { 1 }
    user { nil }
  end
end
