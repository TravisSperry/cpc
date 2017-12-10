# frozen_string_literal: true

User.create(
  email: 'admin@columbuspowdercoat.com',
  first_name: 'Admin',
  last_name: 'User',
  password: 'password',
  password_confirmation: 'password'
)

customer = Customer.create(
  name: 'LaserBiz',
  email: 'info@laserflexexample.com',
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
  first_name: 'Mr. LaserFlex',
  last_name: 'McFlexy',
  phone: '614-555-3333',
  email: 'mcflexy@laserflexexample.com',
  title: 'Owner'
)

contact.save!

customer.primary_contact_id = contact.id

customer.save!
