module SpecTestHelper
  def login(username)
    @user = User.create(id: 4, username: 'admin', name: 'admin manager') if username.is_a?(String)
    request.session[:user] = @user
    request.session[:user_id] = @user.id
  end

  def current_user
    User.find(request.session[:user_id])
  end
end
