# frozen_string_literal: true

class AddOriginalWeightToBoxes < ActiveRecord::Migration
  def change
    add_column :boxes, :original_weight, :integer, default: 0
  end
end
