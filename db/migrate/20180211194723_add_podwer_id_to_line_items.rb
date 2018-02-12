class AddPodwerIdToLineItems < ActiveRecord::Migration[5.1]
  def change
    add_column :line_items, :powder_id, :integer
  end
end
