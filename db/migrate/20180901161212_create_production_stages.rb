class CreateProductionStages < ActiveRecord::Migration[5.2]
  def change
    create_table :production_stages do |t|
      t.string :name
      t.integer :order

      t.timestamps
    end
  end
end
