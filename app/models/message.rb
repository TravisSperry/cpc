class Message

  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming

  attr_accessor :name, :email, :subject, :body, :phone

  validates :name, :presence => true
  validates :email, :format => { :with => %r{.+@.+\..+} }, :allow_blank => false

  def initialize(attributes = {})true
    attributes.each do |name, value|
      send("#{name}=", value)
    end
  end

  def persisted?
    false
  end
end
