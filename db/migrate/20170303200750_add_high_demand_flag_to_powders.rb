# frozen_string_literal: true

class AddHighDemandFlagToPowders < ActiveRecord::Migration
  def change
    add_column :powders, :high_demand, :boolean, default: false
  end
end
