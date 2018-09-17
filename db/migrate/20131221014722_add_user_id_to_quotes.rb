# frozen_string_literal: true

class AddUserIdToQuotes < ActiveRecord::Migration[5.0]
  def change
    add_column :quotes, :user_id, :integer
  end
end
