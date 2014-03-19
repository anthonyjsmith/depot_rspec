require 'spec_helper'

describe "line_items/show" do
  before(:each) do
    @line_item = assign(:line_item, stub_model(LineItem,
      :product => nil,
      :cart => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
