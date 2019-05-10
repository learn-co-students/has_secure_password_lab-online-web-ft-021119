class UsersController < ApplicationController

  def new
    User.new(user_params)
  end

  def create
    return redirect_to '/users/new' if params[:user][:password] != params[:user][:password_confirmation]
    User.new(user_params).save
    session[:user_id] = User.last.id
    redirect_to '/'
  end

  private

  def user_params
    params.require(:user).permit(:name, :username, :password, :password_confirmation)
  end
end
