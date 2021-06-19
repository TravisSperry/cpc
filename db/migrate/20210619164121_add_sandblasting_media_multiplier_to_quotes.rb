class AddSandblastingMediaMultiplierToQuotes < ActiveRecord::Migration[5.2]
  def change
    add_column :quotes, :sandblasting_media_multiplier, :decimal
  end
end
