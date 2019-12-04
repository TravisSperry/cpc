require 'rails_helper'

RSpec.describe "tracking_entries/index", type: :view do
  before(:each) do
    assign(:tracking_entries, [
      TrackingEntry.create!(
        :service => nil
      ),
      TrackingEntry.create!(
        :service => nil
      )
    ])
  end

  it "renders a list of tracking_entries" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
