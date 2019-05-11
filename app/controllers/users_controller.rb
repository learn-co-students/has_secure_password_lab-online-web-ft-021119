class UsersController < ApplicationController
  before_action
  before_action :verify_login, :current_user, only: [:homepage]


  def new
    @user = User.new
  end

  def create
    @user = User.new
    if params[:user][:password] === params[:user][:password_confirmation]
      @user.update(name: params[:user][:name], password: params[:user][:password])
      session[:user_id] = @user.id
      flash[:notice] = "Successfully created account. You are now logged in."
      render :homepage
    else flash[:notice] = "Passwords don't match, please try again."
      redirect_to '/users/new'
    end
  end

  def show
    render :homepage
  end



end
