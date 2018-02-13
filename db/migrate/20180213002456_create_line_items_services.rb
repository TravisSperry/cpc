class CreateLineItemsServices < ActiveRecord::Migration[5.1]
  def change
    create_table :line_items_services do |t|
      t.belongs_to :line_item
      t.belongs_to :service
    end
  end
end
