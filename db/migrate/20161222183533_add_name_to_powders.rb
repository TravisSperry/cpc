# frozen_string_literal: true

class AddNameToPowders < ActiveRecord::Migration
  def change
    add_column :powders, :name, :string
  end
end
