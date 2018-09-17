# frozen_string_literal: true

class AddHighDemandFlagToPowders < ActiveRecord::Migration[5.0]
  def change
    add_column :powders, :high_demand, :boolean, default: false
  end
end
