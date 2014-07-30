require 'spec_helper'

describe SessionsController do

  describe "GET 'new'" do
    it "returns http success" do
      get 'new'
      expect(response).to be_success
    end
  end

  describe "POST 'create'" do
    it "successfully logs in" do
      dave = create(:user)
      post :create, name: dave.name, password: 'secret'
      expect(response).to redirect_to(admin_url)
      expect(session[:user_id]).to eql(dave.id)
    end

    it "fails to log in" do
      dave = create(:user)
      post :create, name: dave.name, password: 'wrong'
      expect(response).to redirect_to(login_url)
    end
  end

  describe "DELETE 'destroy'" do
    it "logs out" do
      delete :destroy
      expect(response).to redirect_to(store_url)
    end
  end

end
