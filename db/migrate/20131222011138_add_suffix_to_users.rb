# frozen_string_literal: true

class AddSuffixToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :suffix, :string
  end
end
