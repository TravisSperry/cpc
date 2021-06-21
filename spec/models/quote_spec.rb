require 'rails_helper'

RSpec.describe Quote, type: :model do
  let(:quote) { build(:quote, quote_attributes) }
  let(:quote_attributes) do
    {
     quote_request_id: quote_request.id,
     labor_hours: labor_hours,
     oven_hours: oven_hours,
     powder_pounds: powder_pounds,
     cost_of_business: cost_of_business,
     pricing_scale: pricing_scale,
     user_id: user_id,
     created_at: created_at,
     updated_at: updated_at,
     hourly_oven_price: hourly_oven_price,
     powder_price: powder_price,
     sandblasting_hours: sandblasting_hours,
     sandblasting_rate: sandblasting_rate,
     sandblasting_media_multiplier: sandblasting_media_multiplier,
     labor_rate: labor_rate
    }
  end
  let(:quote_request) { create(:quote_request) }

  describe '#total' do
  end

  describe '#labor_cost' do
  end

  describe '#powder_cost' do
  end

  describe '#oven_cost' do
  end

  describe '#sandblasting_labor_cost' do
  end

  describe '#total_sandblasting_cost' do
  end

  describe '#soft_costs' do
  end
end
