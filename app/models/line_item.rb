class LineItem < ApplicationRecord
  belongs_to :work_order
  belongs_to :powder
  has_and_belongs_to_many :services
end
