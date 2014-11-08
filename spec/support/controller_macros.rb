module ControllerMacros
  def login_user
    login FactoryGirl.create(:user)
  end

  def login(user)
    cookies[:remember_token] = user.remember_token
    user.update_attribute(:remember_token, User.encrypt(user.remember_token))
  end
end
