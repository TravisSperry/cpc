class CreateBoxes < ActiveRecord::Migration
  def change
    create_table :boxes do |t|
      t.integer :powder_id
      t.integer :weight

      t.timestamps
    end
  end
end
