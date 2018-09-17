# frozen_string_literal: true

class AddStatusToQuotes < ActiveRecord::Migration[5.0]
  def change
    add_column :quotes, :status, :string, null: false, default: 'New'
  end
end
