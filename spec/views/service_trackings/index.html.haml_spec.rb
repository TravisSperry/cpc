require 'rails_helper'

RSpec.describe "service_trackings/index", type: :view do
  before(:each) do
    assign(:service_trackings, [
      ServiceTracking.create!(
        :work_order => nil,
        :tracking_entries => nil
      ),
      ServiceTracking.create!(
        :work_order => nil,
        :tracking_entries => nil
      )
    ])
  end

  it "renders a list of service_trackings" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
