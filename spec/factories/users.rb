FactoryBot.define do
  factory :user do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    email { 'test@example.com' }
    password { 'f4k3p455w0rd' }


    trait :internal do
      user_type { UserType.for UserType::INTERNAL }
    end
  end
end
