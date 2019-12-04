require 'rails_helper'

RSpec.describe "service_trackings/edit", type: :view do
  before(:each) do
    @service_tracking = assign(:service_tracking, ServiceTracking.create!(
      :work_order => nil,
      :tracking_entries => nil
    ))
  end

  it "renders the edit service_tracking form" do
    render

    assert_select "form[action=?][method=?]", service_tracking_path(@service_tracking), "post" do

      assert_select "input[name=?]", "service_tracking[work_order_id]"

      assert_select "input[name=?]", "service_tracking[tracking_entries_id]"
    end
  end
end
