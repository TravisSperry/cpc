# frozen_string_literal: true

class AddLastWeightReminderDateToPowders < ActiveRecord::Migration[5.0]
  def change
    add_column :powders, :last_weight_reminder, :date
  end
end
