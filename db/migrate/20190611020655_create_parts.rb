class CreateParts < ActiveRecord::Migration[5.2]
  def change
    create_table :parts do |t|
      t.string :sku
      t.string :label
      t.text :description
      t.references :customer, foreign_key: true
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
