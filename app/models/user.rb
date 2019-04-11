# frozen_string_literal: true

class User < ApplicationRecord
  acts_as_paranoid
  
  devise :database_authenticatable, :recoverable, :rememberable, :trackable, :validatable

  has_many :quote_requests
  has_many :notes
  has_many :quality_assurance_approvals

  def full_name
    "#{first_name} #{last_name}"
  end
end
