require 'rails_helper'

RSpec.describe "customers/parts/edit", type: :view do
  before(:each) do
    @customer_part = assign(:customer_part, Customers::Part.create!(
      :sku => "MyString",
      :label => "MyString",
      :description => "MyText",
      :customer => nil
    ))
  end

  it "renders the edit customer_part form" do
    render

    assert_select "form[action=?][method=?]", customer_part_path(@customer_part), "post" do

      assert_select "input[name=?]", "customer_part[sku]"

      assert_select "input[name=?]", "customer_part[label]"

      assert_select "textarea[name=?]", "customer_part[description]"

      assert_select "input[name=?]", "customer_part[customer_id]"
    end
  end
end
