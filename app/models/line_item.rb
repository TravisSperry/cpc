class LineItem < ActiveRecord::Base
  belongs_to :work_order
  belongs_to :powder
end
