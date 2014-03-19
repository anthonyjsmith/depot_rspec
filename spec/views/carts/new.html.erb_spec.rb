require 'spec_helper'

describe "carts/new" do
  before(:each) do
    assign(:cart, stub_model(Cart).as_new_record)
  end

  it "renders new cart form" do
    render

    assert_select "form[action=?][method=?]", carts_path, "post" do
    end
  end
end
