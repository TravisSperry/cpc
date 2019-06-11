require 'rails_helper'

RSpec.describe "customers/parts/show", type: :view do
  before(:each) do
    @customer_part = assign(:customer_part, Customers::Part.create!(
      :sku => "Sku",
      :label => "Label",
      :description => "MyText",
      :customer => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Sku/)
    expect(rendered).to match(/Label/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(//)
  end
end
