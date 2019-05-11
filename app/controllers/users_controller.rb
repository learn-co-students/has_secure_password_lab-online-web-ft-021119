class UsersController < ApplicationController

    def new 
        @user = User.new
    end

    def create 
        @user = User.create(user_params)
        if params[:user][:password] == params[:user][:password_confirmation] && @user.save
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else 
            redirect_to  new_user_path, alert: "invalid input"
        end
    end


    private 

    def user_params
        params.require(:user).permit(:name, :password, :password_confirmation)
    end

end