class ApplicationController < ActionController::Base
  private

  def current_user
    User.where(id: session[:user_id]).first if session[:user_id]
  end

  def signed_in?
    return true if current_user&.id

    false
  end

  helper_method :current_user, :signed_in?
end
