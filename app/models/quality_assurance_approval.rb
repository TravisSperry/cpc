class QualityAssuranceApproval < ApplicationRecord
  belongs_to :work_order
  belongs_to :user
end
