FactoryBot.define do
  factory :customer_part, class: 'Customers::Part' do
    sku { "MyString" }
    label { "MyString" }
    description { "MyText" }
    customer { nil }
  end
end
