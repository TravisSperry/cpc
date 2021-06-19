# frozen_string_literal: true

class Quote < ApplicationRecord
  belongs_to :quote_request
  belongs_to :user

  def total
    ((cost_of_business * soft_costs) + soft_costs) / (1.0 - pricing_scale)
  end

  def labor_cost
    labor_hours * (labor_rate || Cpc::QuoteForm::LABOR_RATE)
  end

  def powder_cost
    powder_pounds * powder_price
  end

  def oven_cost
    oven_hours * hourly_oven_price
  end

  def sandblasting_media_cost
    sandblasting_labor_cost * (sandblasting_media_multiplier || Cpc::QuoteForm::SANDBLASTING_MEDIA_MULTIPLIER)
  end

  def sandblasting_labor_cost
    sandblasting_hours * sandblasting_rate
  end

  def total_sandblasting_cost
    sandblasting_labor_cost + sandblasting_media_cost
  end

  def soft_costs
    labor_cost + oven_cost + powder_cost + total_sandblasting_cost
  end
end
