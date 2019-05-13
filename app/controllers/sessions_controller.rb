class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by(name: params[:user][:name])
    valid_user = @user.try(:authenticate, params[:user][:password])
      if valid_user
        session[:user_id] = @user.id
        redirect_to root_path
      else
        redirect_to login_path
      end
  end

  def destroy
    session.delete :user_id
    redirect_to root_path
  end
end
