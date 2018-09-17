# frozen_string_literal: true

class ChangeNotesContent < ActiveRecord::Migration[5.0]
  def change
    change_column :notes, :content, :text
  end
end
