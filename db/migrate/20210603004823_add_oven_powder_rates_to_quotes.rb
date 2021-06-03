class AddOvenPowderRatesToQuotes < ActiveRecord::Migration[5.2]
  def change
    add_column :quotes, :hourly_oven_price, :decimal
    add_column :quotes, :powder_price, :decimal
  end
end
