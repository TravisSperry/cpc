# frozen_string_literal: true

class Contact < ApplicationRecord
  attr_accessor :make_primary_contact

  belongs_to :customer, inverse_of: 'primary_contact',
                        foreign_key: 'primary_contact_id'
  belongs_to :contact_type
  belongs_to :customer

  validates_presence_of :first_name, :last_name, :phone

  def full_name
    "#{first_name} #{last_name}"
  end

  def full_name_and_title
    "#{first_name} #{last_name} (#{title})"
  end

  def is_primary?
    return false unless customer

    customer.primary_contact_id == id
  end
end
