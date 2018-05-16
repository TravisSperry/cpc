# frozen_string_literal: true

class User < ApplicationRecord
  if Rails.env.production?
    devise :database_authenticatable, :recoverable, :rememberable, :trackable, :validatable, :registerable
  else
    devise :database_authenticatable, :recoverable, :rememberable, :trackable, :validatable, :registerable
  end
  has_many :quote_requests
  has_many :notes
  has_many :quality_assurance_approvals

  def full_name
    "#{first_name} #{last_name}"
  end
end
