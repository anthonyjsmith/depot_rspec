# See https://github.com/plataformatec/devise/wiki/How-To:-Controllers-tests-with-Rails-3-(and-rspec)
module RequestMacros
  def login_admin
    before(:each) do
      user = create(:user, name: 'admin')
      post login_path, name: user.name, password: 'secret'
    end
  end
end
