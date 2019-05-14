class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(name: user_params[:name])
    if @user.try(:authenticate, user_params[:password])
      session[:user_id] = @user.id
       redirect_to user_path(@user)
    else
       render :new
    end
  end

  def destroy
  end

  private
  def user_params
     params.require(:user).permit(:name, :password)
  end

end
