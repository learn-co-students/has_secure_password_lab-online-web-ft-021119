
class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    return redirect_to '/users/new' if params[:user][:password] != params[:user][:password_confirmation]
    User.new(user_params).save
    session[:user_id] = User.last.id
    redirect_to welcome_path
  end

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end
end
