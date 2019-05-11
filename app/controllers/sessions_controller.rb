class SessionsController < ApplicationController

  def new#render login form
    binding.pry
  end

  def create#create new session, ie log in user.
    #binding.pry
    @user = User.find_by(name: params[:user][:name])

    if @user.try(:authenticate, params[:user][:password])
      session[:user_id] = @user.id
      flash[:notice]
      redirect_to users_path(@user)
    else
      render :new
    end

  end

  def destroy
    session.destroy
    redirect_to '/'
  end


end
