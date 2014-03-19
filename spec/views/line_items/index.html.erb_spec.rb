require 'spec_helper'

describe "line_items/index" do
  let(:product) { Product.new }
  let(:cart) { Cart.new }

  before(:each) do
    assign(:line_items, [
      stub_model(LineItem,
                 product: product,
                 cart: cart
      ),
      stub_model(LineItem,
                 product: product,
                 cart: cart
      )
    ])
  end

  it "renders a list of line_items" do
    render
    assert_select "tr>td", text: CGI.escapeHTML(product.to_s), count: 2
    assert_select "tr>td", text: CGI.escapeHTML(cart.to_s), count: 2
  end
end
