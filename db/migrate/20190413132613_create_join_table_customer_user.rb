class CreateJoinTableCustomerUser < ActiveRecord::Migration[5.2]
  def change
    create_join_table :customers, :users do |t|
      t.index %i[customer_id user_id]
    end
  end
end
