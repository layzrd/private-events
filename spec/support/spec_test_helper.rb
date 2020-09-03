module SpecTestHelper   
  def login(username)
    user = User.new(id: 4, username: "admin", name: "admin manager", created_at: "2020-09-02 18:12:39", updated_at: "2020-09-02 18:12:39") if username.is_a?(String)
 
    request.session[:user] = user
    request.session[:user_id] = user.id
    
  end

  def current_user
    User.find(request.session[:user])
  end
end
