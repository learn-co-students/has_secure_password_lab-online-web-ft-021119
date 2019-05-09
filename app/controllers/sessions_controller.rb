class SessionsController < ApplicationController
  def new
    @user = User.new
  end
  def create #login
    #params = "user"=>{"username"=>"lchan", "password"=>"12341234", "password_confirmation"=>""
     @user = User.find_by(username: params[:user][:username])
    if @user && @user.authenticate(params[:user][:password])
       session[:user_id] = @user.id
       redirect_to '/home'
     else
       flash[:alert] = "pw incorrect"
       redirect_to '/signup'
     end
   end
end
