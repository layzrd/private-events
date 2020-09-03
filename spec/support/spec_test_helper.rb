module SpecTestHelper
  def login(user)
    user = User.where(username: username).first if user.is_a?(String)
    request.session[:user] = user
  end

  def current_user
    User.find(request.session[:user])
  end
end
