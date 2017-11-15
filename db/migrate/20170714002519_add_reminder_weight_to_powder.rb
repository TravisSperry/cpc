# frozen_string_literal: true

class AddReminderWeightToPowder < ActiveRecord::Migration
  def change
    add_column :powders, :reminder_weight, :integer
  end
end
