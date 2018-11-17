class ServiceSchedule < ApplicationRecord
  belongs_to :work_order_schedule
  belongs_to :service
end
