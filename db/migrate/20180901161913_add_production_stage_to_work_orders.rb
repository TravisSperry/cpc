class AddProductionStageToWorkOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :work_orders, :production_stage_id, :integer
  end
end
