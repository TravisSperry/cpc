# frozen_string_literal: true

class AddDefaultsToPowders < ActiveRecord::Migration[5.0]
  def change
    change_column :powders, :reminder_weight, :integer, default: 1
  end
end
