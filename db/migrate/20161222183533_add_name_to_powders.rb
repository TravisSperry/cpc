# frozen_string_literal: true

class AddNameToPowders < ActiveRecord::Migration[5.0]
  def change
    add_column :powders, :name, :string
  end
end
