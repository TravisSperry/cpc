# frozen_string_literal: true

class CreateBoxes < ActiveRecord::Migration[5.0]
  def change
    create_table :boxes do |t|
      t.integer :powder_id
      t.integer :weight

      t.timestamps
    end
  end
end
