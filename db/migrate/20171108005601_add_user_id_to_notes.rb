# frozen_string_literal: true

class AddUserIdToNotes < ActiveRecord::Migration
  def change
    add_column :notes, :user_id, :integer
  end
end
