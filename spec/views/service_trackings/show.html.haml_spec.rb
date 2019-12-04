require 'rails_helper'

RSpec.describe "service_trackings/show", type: :view do
  before(:each) do
    @service_tracking = assign(:service_tracking, ServiceTracking.create!(
      :work_order => nil,
      :tracking_entries => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
