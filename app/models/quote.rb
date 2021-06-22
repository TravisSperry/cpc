# frozen_string_literal: true

class Quote < ApplicationRecord
  belongs_to :quote_request
  belongs_to :user

  def total
    coating_costs + total_sandblasting_cost
  end

  def labor_cost
    ((labor_hours || 0) * (labor_rate || Cpc::QuoteForm::LABOR_RATE)).to_f
  end

  def powder_cost
    return 0 unless powder_pounds
    (powder_pounds * powder_price).to_f
  end

  def oven_cost
    return 0 unless oven_hours
    (oven_hours * hourly_oven_price).to_f
  end

  def sandblasting_media_cost
    (sandblasting_labor_cost * (sandblasting_media_multiplier || Cpc::QuoteForm::SANDBLASTING_MEDIA_MULTIPLIER)).to_f
  end

  def sandblasting_labor_cost
    return 0 unless sandblasting_hours
    (sandblasting_hours * sandblasting_rate).to_f
  end

  def coating_costs
    ((cost_of_business.to_f * soft_costs) + soft_costs) / margin_divisor
  end

  def total_sandblasting_cost
    (sandblasting_labor_cost + sandblasting_media_cost) / margin_divisor
  end

  def soft_costs
    (labor_cost + oven_cost + powder_cost).to_f
  end

  def margin_divisor
    (1.0.to_f - pricing_scale.to_f)
  end
end
