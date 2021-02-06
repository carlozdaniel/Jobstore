module ControllerMacros
  def login_user
    before :each do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      user = FactoryGirl.create(:user, email: "user@example.com")
      sign_in user
    end
end