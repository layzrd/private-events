class ApplicationController < ActionController::Base
  private

  def current_user
    session[:user] if session[:user]
  end

  def signed_in?
    return true if session[:user_id]

    false
  end

  def authenticated?
    return if signed_in?

    flash[:error] = 'Please login first'
    redirect_to session_new_path
  end

  helper_method :current_user, :signed_in?, :authenticated?
end
