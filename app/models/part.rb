class Part < ApplicationRecord
  belongs_to :customer

  acts_as_paranoid

  delegate :name, to: :customer, prefix: true
end
