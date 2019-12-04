require 'rails_helper'

RSpec.describe "service_trackings/new", type: :view do
  before(:each) do
    assign(:service_tracking, ServiceTracking.new(
      :work_order => nil,
      :tracking_entries => nil
    ))
  end

  it "renders new service_tracking form" do
    render

    assert_select "form[action=?][method=?]", service_trackings_path, "post" do

      assert_select "input[name=?]", "service_tracking[work_order_id]"

      assert_select "input[name=?]", "service_tracking[tracking_entries_id]"
    end
  end
end
