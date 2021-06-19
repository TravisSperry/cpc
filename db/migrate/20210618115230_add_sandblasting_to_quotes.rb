class AddSandblastingToQuotes < ActiveRecord::Migration[5.2]
  def change
    add_column :quotes, :sandblasting_hours, :decimal
    add_column :quotes, :sandblasting_rate, :decimal
  end
end
