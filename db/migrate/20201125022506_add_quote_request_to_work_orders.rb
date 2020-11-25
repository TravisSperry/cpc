class AddQuoteRequestToWorkOrders < ActiveRecord::Migration[5.2]
  def change
    add_reference :work_orders, :quote_request, foreign_key: true, index: { unique: true }
  end
end
