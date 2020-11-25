require 'rails_helper'

RSpec.describe "tracking_entries/show", type: :view do
  before(:each) do
    @tracking_entry = assign(:tracking_entry, TrackingEntry.create!(
      :service => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
  end
end
