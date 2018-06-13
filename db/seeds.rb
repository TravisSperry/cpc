# frozen_string_literal: true

unless User.find_by email: 'admin@columbuspowdercoat.com'
  User.create(
    email: 'admin@columbuspowdercoat.com',
    first_name: 'Admin',
    last_name: 'User',
    password: 'password',
    password_confirmation: 'password'
  )
end

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

  Service.create(name: 'Powder Coating')
  Service.create(name: 'Zinc Primer')
  Service.create(name: 'Sand Blasting')
  Service.create(name: 'Fabrication')
  Service.create(name: 'Other/Repair/Shop Service')

  work_order = customer.work_orders.build(name: "Work Order #{n}")

  items = ['tubes', 'plates', 'rims', 'round bar', 'square bar', 'patio chair']

  rand(1..5).times do
    work_order.line_items.build(description: items.sample,
                                quantity: rand(1..10),
                                notes: Faker::Lorem.sentence)
  end

  customer.save!
  work_order.save!
  work_order.update! status:  WorkOrder.statuses.values.sample
end
