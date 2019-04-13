class CustomersUser < ApplicationRecord
  belongs_to :user, inverse_of: :customers_users
  belongs_to :customer, inverse_of: :customers_users
end
