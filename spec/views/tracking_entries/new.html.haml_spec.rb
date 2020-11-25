require 'rails_helper'

RSpec.describe "tracking_entries/new", type: :view do
  before(:each) do
    assign(:tracking_entry, TrackingEntry.new(
      :service => nil
    ))
  end

  it "renders new tracking_entry form" do
    render

    assert_select "form[action=?][method=?]", tracking_entries_path, "post" do

      assert_select "input[name=?]", "tracking_entry[service_id]"
    end
  end
end
