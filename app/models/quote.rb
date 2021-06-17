# frozen_string_literal: true

class Quote < ApplicationRecord
  belongs_to :quote_request
  belongs_to :user

  def total
    (cob + soft_costs) / (1 - pricing_scale.to_f)
  end

  def labor_cost
    labor_hours.to_f * Cpc::QuoteForm::LABOR_RATE
  end

  def powder_cost
    powder_pounds.to_f * powder_price.to_f
  end

  def oven_cost
    oven_hours.to_f * hourly_oven_price.to_f
  end

  def soft_costs
    labor_cost + oven_cost + powder_cost
  end

  def cob
    soft_costs * cost_of_business
  end
end
