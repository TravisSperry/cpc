class WorkOrderSchedule < ApplicationRecord
  belongs_to :work_order
  has_many :service_schedules

  accepts_nested_attributes_for :service_schedules, reject_if: :all_blank, allow_destroy: true
end
