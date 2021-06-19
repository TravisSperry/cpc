class AddLaborRateToQuotes < ActiveRecord::Migration[5.2]
  def change
    add_column :quotes, :labor_rate, :decimal
  end
end
