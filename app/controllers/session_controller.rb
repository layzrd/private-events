class SessionController < ApplicationController
  def new; end

  def create
    if params.has_key?(:username).present?
      flash[:alert] = 'Please provide username.'
      redirect_to session_new_path
      return
    end
    @user = User.find_by(username: params[:username])
    if @user
      session[:user_id] = @user.id
      redirect_to users_path
    else
      flash[:alert] = 'the given username is not exist.'
      redirect_to session_new_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to session_new_path
  end
end
