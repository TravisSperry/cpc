# frozen_string_literal: true

class User < ActiveRecord::Base
  if Rails.env.production?
    devise :database_authenticatable, :recoverable, :rememberable, :trackable, :validatable, :registerable
  else
    devise :database_authenticatable, :recoverable, :rememberable, :trackable, :validatable, :registerable
  end
  has_many :quote_requests
  has_many :notes

  def full_name
    first_name.to_s
  end
end
