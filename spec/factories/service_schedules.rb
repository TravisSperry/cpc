FactoryBot.define do
  factory :service_schedule do
    work_order_schedule { nil }
    service { nil }
    start_date { '2018-11-17 11:04:29' }
    end_date { '2018-11-17 11:04:29' }
  end
end
