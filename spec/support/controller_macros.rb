# See https://github.com/plataformatec/devise/wiki/How-To:-Controllers-tests-with-Rails-3-(and-rspec)
# And https://github.com/plataformatec/devise/wiki/How-To:-Stub-authentication-in-controller-specs
module ControllerMacros
  def login_admin
    before(:each) do
      session[:user_id] = create(:user, name: 'admin').id
    end
  end
end
