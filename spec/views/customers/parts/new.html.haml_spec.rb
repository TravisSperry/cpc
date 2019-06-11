require 'rails_helper'

RSpec.describe "customers/parts/new", type: :view do
  before(:each) do
    assign(:customer_part, Customers::Part.new(
      :sku => "MyString",
      :label => "MyString",
      :description => "MyText",
      :customer => nil
    ))
  end

  it "renders new customer_part form" do
    render

    assert_select "form[action=?][method=?]", customer_parts_path, "post" do

      assert_select "input[name=?]", "customer_part[sku]"

      assert_select "input[name=?]", "customer_part[label]"

      assert_select "textarea[name=?]", "customer_part[description]"

      assert_select "input[name=?]", "customer_part[customer_id]"
    end
  end
end
