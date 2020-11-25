require 'rails_helper'

RSpec.describe "tracking_entries/edit", type: :view do
  before(:each) do
    @tracking_entry = assign(:tracking_entry, TrackingEntry.create!(
      :service => nil
    ))
  end

  it "renders the edit tracking_entry form" do
    render

    assert_select "form[action=?][method=?]", tracking_entry_path(@tracking_entry), "post" do

      assert_select "input[name=?]", "tracking_entry[service_id]"
    end
  end
end
