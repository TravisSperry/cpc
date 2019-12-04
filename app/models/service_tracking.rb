class ServiceTracking < ApplicationRecord
  belongs_to :work_order
  belongs_to :tracking_entries
end
