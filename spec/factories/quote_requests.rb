FactoryBot.define do
  factory QuoteRequest do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.first_name }
    job_title { Faker::Job.title }
    company_name { Faker::Company.name }
    address_1 { Faker::Address.street_address }
    city { Faker::Address.city }
    state { Faker::Address.state }
    zip { Faker::Address.postcode }
    email { Faker::Internet.safe_email }
    telephone { Faker::PhoneNumber.phone_number }
    fax { Faker::PhoneNumber.phone_number }
    association :user, :internal
  end
end
