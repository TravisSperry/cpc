# frozen_string_literal: true

class Contact < ActiveRecord::Base
  belongs_to :customer, inverse_of: 'primary_contact'

  def full_name
    "#{first_name} #{last_name}"
  end

  def full_name_and_title
    "#{first_name} #{last_name} (#{title})"
  end
end
