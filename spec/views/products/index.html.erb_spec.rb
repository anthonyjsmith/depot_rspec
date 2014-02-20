require 'spec_helper'

describe "products/index" do
  before(:each) do
    assign(:products, [
      stub_model(Product,
        :title => "Title",
        :description => "MyText",
        :image_url => "ImageUrl",
        :price => "9.99"
      ),
      stub_model(Product,
        :title => "Title",
        :description => "MyText",
        :image_url => "ImageUrl",
        :price => "9.99"
      )
    ])
  end

  it "renders a list of products" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td>dl>dt", :text => "Title".to_s, :count => 2
    assert_select "tr>td>dl>dd", :text => "MyText".to_s, :count => 2
    assert_select "tr>td>img[src=/images/ImageUrl]", :count => 2
  end
end
