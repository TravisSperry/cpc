# frozen_string_literal: true

class AddReminderWeightToPowder < ActiveRecord::Migration[5.0]
  def change
    add_column :powders, :reminder_weight, :integer
  end
end
