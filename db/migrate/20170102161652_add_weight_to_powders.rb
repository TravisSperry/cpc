class AddWeightToPowders < ActiveRecord::Migration
  def change
    add_column :powders, :weight, :integer, default: 0
  end
end
