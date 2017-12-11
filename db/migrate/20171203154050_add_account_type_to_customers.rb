class AddAccountTypeToCustomers < ActiveRecord::Migration
  def change
    add_column :customers, :account_type, :integer, default: 0
  end
end
