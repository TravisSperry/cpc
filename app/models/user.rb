# frozen_string_literal: true

class User < ApplicationRecord
  acts_as_paranoid

  devise :database_authenticatable, :recoverable, :rememberable, :trackable, :validatable

  has_many :quote_requests
  has_many :notes
  has_many :quality_assurance_approvals
  has_many :customers_users
  has_many :customers, through: :customers_users
  belongs_to :user_type

  def full_name
    "#{first_name} #{last_name}"
  end
end
