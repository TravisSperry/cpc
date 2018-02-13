class Service < ApplicationRecord
  has_and_belongs_to_many :work_orders
  has_and_belongs_to_many :line_items
end
