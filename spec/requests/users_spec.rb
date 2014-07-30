require 'spec_helper'

describe "Users" do
  login_admin

  describe "GET /users" do
    it "works! (now write some real specs)" do
      get users_path
      expect(response.status).to be(200)
    end
  end
end
