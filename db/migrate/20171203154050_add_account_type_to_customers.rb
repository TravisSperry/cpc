class AddAccountTypeToCustomers < ActiveRecord::Migration[5.0]
  def change
    add_column :customers, :account_type, :integer, default: 0
  end
end
