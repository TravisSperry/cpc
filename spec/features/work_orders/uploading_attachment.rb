require "rails_helper"

RSpec.feature "Creating a work order", :type => :feature do
  let(:user) { create(:user) }
  let!(:company) { create(:customer, :company_type) }

  before do
    login_as(user, :scope => :user)
  end

  scenario "successfully creating a work order" do
    visit new_customer_work_order_path(company)
  end

  describe "When a user tries to create a work order without a company" do
    it "redirects to the dashboard and flashes a message" do
      visit "/work_orders/new"
      expect(current_path).to eq(root_path)
      expect(page)
        .to have_content("You must create a work order from a company's account.")
    end
  end
end
