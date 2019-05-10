class UsersController < ApplicationController
   

    def new

    end


	  def create
	  	
	  	if params["user"]["password"] != params["user"]["password_confirmation"]
	  		redirect_to '/users/new'
	  	else
	  		user = User.create(user_params)
	  		user.save
	  		session[:user_id] = user.id
	  		redirect_to '/'

	  	end


	  end

	  private

	  def user_params
	  	params.require(:user).permit(:name, :password, :password_confirmation)
	  end
end
