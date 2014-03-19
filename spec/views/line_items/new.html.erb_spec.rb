require 'spec_helper'

describe "line_items/new" do
  before(:each) do
    assign(:line_item, stub_model(LineItem,
      :product => nil,
      :cart => nil
    ).as_new_record)
  end

  it "renders new line_item form" do
    render

    assert_select "form[action=?][method=?]", line_items_path, "post" do
      assert_select "input#line_item_product[name=?]", "line_item[product]"
      assert_select "input#line_item_cart[name=?]", "line_item[cart]"
    end
  end
end
