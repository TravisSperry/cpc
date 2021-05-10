class CreateQuotes < ActiveRecord::Migration[5.2]
  def change
    create_table :quotes do |t|
      t.references :quote_request, foreign_key: true
      t.decimal :labor_hours, precision: 10, scale: 2
      t.decimal :oven_hours, precision: 10, scale: 2
      t.decimal :powder_pounds, precision: 10, scale: 2
      t.integer :cost_of_business
      t.integer :pricing_scale
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
