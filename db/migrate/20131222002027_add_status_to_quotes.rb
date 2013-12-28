class AddStatusToQuotes < ActiveRecord::Migration
  def change
    add_column :quotes, :status, :string, null: false, default: "New"
  end
end
