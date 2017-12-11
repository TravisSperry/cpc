class CreateLineItems < ActiveRecord::Migration
  def change
    create_table :line_items do |t|
      t.text :description
      t.integer :quantity
      t.text :notes
    end
  end
end
