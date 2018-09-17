# frozen_string_literal: true

class AddOriginalWeightToBoxes < ActiveRecord::Migration[5.0]
  def change
    add_column :boxes, :original_weight, :integer, default: 0
  end
end
