# frozen_string_literal: true

class AddSuffixToUsers < ActiveRecord::Migration
  def change
    add_column :users, :suffix, :string
  end
end
