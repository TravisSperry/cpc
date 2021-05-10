class AddQuoteDetailsToWorkOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :work_orders, :quickbooks_invoice_id, :string
  end
end
