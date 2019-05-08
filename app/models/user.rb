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

  validates :user_type, presence: true
  validate :ensure_valid_user_type
  validate :max_customer_associations

  def user_type?(user_type_name)
    user_type.name == UserType.for(user_type_name).name
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def ensure_valid_user_type
    if customer_ids.any? && user_type == UserType.for(:internal)
      errors.add(:user_type, "cannot be internal if you're trying to add this user to a company")
    end
  end

  def max_customer_associations
    if customer_ids && customer_ids.count > 1
      errors.add(:customers, "users cannot be associated to more than one company at this time")
    end
  end
end
