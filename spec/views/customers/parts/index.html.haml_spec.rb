require 'rails_helper'

RSpec.describe "customers/parts/index", type: :view do
  before(:each) do
    assign(:customer_parts, [
      Customers::Part.create!(
        :sku => "Sku",
        :label => "Label",
        :description => "MyText",
        :customer => nil
      ),
      Customers::Part.create!(
        :sku => "Sku",
        :label => "Label",
        :description => "MyText",
        :customer => nil
      )
    ])
  end

  it "renders a list of customers/parts" do
    render
    assert_select "tr>td", :text => "Sku".to_s, :count => 2
    assert_select "tr>td", :text => "Label".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
