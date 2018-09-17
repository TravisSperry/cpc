class AddAttachmentsToWorkOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :work_orders, :attachments, :string, array: true, default: []
  end
end
