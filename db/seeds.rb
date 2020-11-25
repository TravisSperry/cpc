# frozen_string_literal: true

ProductionStage.find_or_create_by(name: 'Sandblasting', order: 1)
ProductionStage.find_or_create_by(name: 'Prep', order: 2)
ProductionStage.find_or_create_by(name: 'Coating', order: 3)
ProductionStage.find_or_create_by(name: 'Packaging', order: 4)

Service.find_or_create_by(name: 'Powder Coating')
Service.find_or_create_by(name: 'Zinc Primer')
Service.find_or_create_by(name: 'Sand Blasting')
Service.find_or_create_by(name: 'Fabrication')
Service.find_or_create_by(name: 'Other/Repair/Shop Service')

ContactType.find_or_create_by(name: 'Primary')

if Rails.env.development?
  User.create_with(
    first_name: 'Admin',
    last_name: 'User',
    user_type: UserType.for(:internal),
    password: 'password',
    password_confirmation: 'password'
  ).find_or_create_by(
    email: 'admin@columbuspowdercoat.com'
  )


  customer_user = User.create_with(
    first_name: 'Customer',
    last_name: 'User',
    user_type: UserType.for(:customer),
    password: 'password',
    password_confirmation: 'password'
  ).find_or_create_by(
    email: 'customer@columbuspowdercoat.com'
  )

  30.times do |n|
    customer = Customer.create(
      name: Faker::Company.name,
      email: Faker::Internet.email,
      phone: '614-555-5555',
      fax: '614-555-4444',
      address1: '123 Anywhere St',
      address2: '',
      city: 'CityTown',
      state: 'Ohio',
      zip_code: '43065',
      account_type: 0
    )

    contact = customer.contacts.build(
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name,
      phone: '614-555-3333',
      email: Faker::Internet.email,
      title: 'Owner'
    )

    customer.primary_contact_id = contact.id

    work_order = customer.work_orders.build(name: "Work Order #{n}")

    items = ['tubes', 'plates', 'rims', 'round bar', 'square bar', 'patio chair']

    rand(1..5).times do
      work_order.line_items.build(description: items.sample,
                                  quantity: rand(1..10),
                                  notes: Faker::Lorem.sentence)
    end

    customer.save!
    work_order.save!
    work_order.update! status: WorkOrder.statuses.values.sample
  end

  Customer.all.sample.users << customer_user
end
