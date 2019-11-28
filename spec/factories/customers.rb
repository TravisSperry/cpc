FactoryBot.define do
  factory :customer do
    name      { Faker::Company.name }
    phone     { Faker::PhoneNumber.phone_number }
    fax       { Faker::PhoneNumber.phone_number }
    address1  { Faker::Address.street_address }
    city      { Faker::Address.city }
    state     { Faker::Address.state }
    zip_code  { Faker::Address.zip_code }
    email     { Faker::Internet.email }
  end

  trait :company_type do
    account_type { :company }
  end
end
