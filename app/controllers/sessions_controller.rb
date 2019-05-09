class SessionsController < ApplicationController
   def new

   end

   def create
      @user = User.find_by(name: user_params[:name])
      if @user.try(:authenticate, user_params[:password])
         set_user
         redirect_to user_path(@user)
      else
         render :new
      end
   end

   def destroy
      session.clear unless session[:name].nil?
   end

   private
      def user_params
         params.require(:user).permit(:name, :password)
      end
end