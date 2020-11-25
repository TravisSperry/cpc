# frozen_string_literal: true

class UserType < ApplicationRecord
  VALID_TYPES = [
    INTERNAL = :internal,
    CUSTOMER = :customer,
  ]

  def self.for_all
    VALID_TYPES.map{ |type_name| self.for(type_name) }
  end

  def self.for(type_name)
    find_or_create_by(name: type_name)
  end
end
