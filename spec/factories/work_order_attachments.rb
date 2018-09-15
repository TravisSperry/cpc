FactoryBot.define do
  factory :work_order_attachment do
    attachment "MyString"
    work_order nil
  end
end
