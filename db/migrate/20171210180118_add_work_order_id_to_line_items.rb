class AddWorkOrderIdToLineItems < ActiveRecord::Migration
  def change
    add_column :line_items, :work_order_id, :integer
  end
end
