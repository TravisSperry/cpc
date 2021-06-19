class UpdatePricingCobColumnTypeToQuotes < ActiveRecord::Migration[5.2]
  def change
    change_column :quotes, :pricing_scale, :decimal
    change_column :quotes, :cost_of_business, :decimal
  end
end
