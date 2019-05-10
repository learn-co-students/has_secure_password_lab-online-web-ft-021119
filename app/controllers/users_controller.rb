class UsersController < ApplicationController
    def new
      @user = User.new
    end

    def create
       @user = User.new(user_params)
      if @user.save && @user.authenticate(params[:user][:password])
         session[:user_id] = @user.id
         redirect_to '/home'
       else
         redirect_to '/signup'
       end
     end

    private
    def user_params
      params.require(:user).permit(:username, :name, :password, :password_confirmation)
    end
  end
