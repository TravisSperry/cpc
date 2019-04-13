class AddCanHaveUsersFlagToCustomers < ActiveRecord::Migration[5.2]
  def change
    add_column :customers, :can_have_users, :boolean
  end
end
