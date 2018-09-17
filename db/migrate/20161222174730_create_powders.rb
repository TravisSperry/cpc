# frozen_string_literal: true

class CreatePowders < ActiveRecord::Migration[5.0]
  def change
    create_table :powders do |t|
      t.integer :manufacturer_id
      t.integer :color_id
      t.string :part_number

      t.timestamps
    end
  end
end
