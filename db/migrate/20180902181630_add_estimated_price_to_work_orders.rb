class AddEstimatedPriceToWorkOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :work_orders, :estimated_price, :string
  end
end
