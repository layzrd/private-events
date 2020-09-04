class SessionsController < ApplicationController
  def new; end

  def create
    unless params[:username].present?
      flash[:alert] = 'Please provide username.'
      redirect_to new_session_path
      return
    end
    @user = User.find_by(username: params[:username])
    if @user
      session[:user_id] = @user.id
      session[:user] = @user
      redirect_to users_path
    else
      flash[:alert] = 'the given username is not exist.'
      redirect_to new_session_path
    end
  end

  def destroy
    session[:user] = nil
    session[:user_id] = nil
    redirect_to new_session_path
  end
end
