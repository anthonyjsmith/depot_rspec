require 'spec_helper'

describe "carts/edit" do
  before(:each) do
    @cart = assign(:cart, stub_model(Cart))
  end

  it "renders the edit cart form" do
    render

    assert_select "form[action=?][method=?]", cart_path(@cart), "post" do
    end
  end
end
