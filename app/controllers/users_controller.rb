class UsersController < ApplicationController
  def new
  end

  def create
    @user = User.create(user_params)

    if @user && !@user.id.nil?
      return head(:forbidden) unless @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to homepage_path
    else
      redirect_to signup_path
    end
  end

  def show
    @user = User.find_by_id(session[:user_id])
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end
end
