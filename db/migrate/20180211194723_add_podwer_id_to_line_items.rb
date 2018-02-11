class AddPodwerIdToLineItems < ActiveRecord::Migration
  def change
    add_column :line_items, :powder_id, :integer
  end
end
