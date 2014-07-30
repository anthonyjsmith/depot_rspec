require 'spec_helper'

describe "LineItems" do
  login_admin

  describe "GET /line_items" do
    it "works! (now write some real specs)" do
      get line_items_path
      expect(response.status).to be(200)
    end
  end
end
