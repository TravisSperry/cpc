class LineItem < ApplicationRecord
  belongs_to :work_order
  belongs_to :powder
end
