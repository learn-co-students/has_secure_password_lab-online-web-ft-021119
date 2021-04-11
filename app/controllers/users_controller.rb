class UsersController < ApplicationController
  def new
     @user = User.new
   end
   def create
      @user = User.new(user_params) #creates new user
     if @user.save && @user.authenticate(params[:user][:password])
        session[:user_id] = @user.id
        redirect_to '/home'
        #logs you in and sets your password if the confirmation matches
      else
        redirect_to '/users/new'
        #redirects you if your password and confirmation don't match

      end
    end

   private
   def user_params
     params.require(:user).permit(:username, :name, :password, :password_confirmation)
   end
 end
