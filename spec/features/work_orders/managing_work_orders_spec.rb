require 'rails_helper'

RSpec.describe 'Managing a work order', type: :feature do
  let(:user) { create(:user, :internal) }
  let!(:company) { create(:customer, :company_type) }
  let(:job_name) { Faker::Company.name }
  let(:date_scheduled) { Time.now.strftime('%Y-%m-%e %H:%M') }
  let(:date_due) { (Time.now + 2.days).strftime('%Y-%m-%e %H:%M') }
  let(:estimated_price) { junk(:int, size: 4).to_s }

  before do
    login_as(user, scope: :user)
  end

  it 'successfully creating a work order' do
    visit new_customer_work_order_path(company)
    fill_in_account_and_scheduling_information
    expect { click_button 'Save Work Order' }.to change { WorkOrder.count }.by(1)
  end

  it 'successfully creating a work order with a line item' do
    visit new_customer_work_order_path(company)
    fill_in_account_and_scheduling_information
    add_line_item
    expect { click_button 'Save Work Order' }
      .to change { LineItem.count }.by(1)
  end

  xit 'successfully creating a work order with an attachment' do
    visit new_customer_work_order_path(company)
    fill_in_account_and_scheduling_information
    click_button 'Save Work Order'
    attach_file('Attachments', Rails.root + 'spec/fixtures/test.pdf')
    click_button 'Add Attachments'
  end

  describe 'When a user tries to create a work order without a company' do
    it 'redirects to the dashboard and flashes a message' do
      visit '/work_orders/new'

      expect(current_path).to eq(root_path)
      expect(page)
        .to have_content("You must create a work order from a company's account.")
    end
  end

  def fill_in_account_and_scheduling_information
    fill_in 'Job Name', with: job_name
    fill_in 'Date scheduled', with: date_scheduled
    fill_in 'Date due', with: date_due
    fill_in 'Estimated price', with: estimated_price
  end

  def add_line_item(index = 0)
    click_button 'Add Line Item' if index > 0
    fill_in("#{line_item_id_prefix}_#{index}_description", with: Faker::Beer.style)
    fill_in("#{line_item_id_prefix}_#{index}_quantity", with: junk(:int, size: 2))
    fill_in("#{line_item_id_prefix}_#{index}_notes", with: Faker::Beer.name)
  end

  def line_item_id_prefix
    'work_order_line_items_attributes'
  end
end
