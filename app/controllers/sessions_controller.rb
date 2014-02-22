class SessionsController < ApplicationController
  before_action :check_for_logged_in, :only => [:new]

  def check_for_logged_in
    redirect_to root_url if logged_in?
  end

  def new
    @user = User.new
    render :new
  end

  def create    #this creates the session
    @user = User.find_by_credentials(params[:user])
    if @user && @user.activated?
      login!(@user)
      flash[:success] = "Logged in successfully"
      redirect_to root_url
    elsif @user && @user.activated == false
      flash.now[:error] = "Please activate your account first!"
      render :new
    else
      flash.now[:error] = "Incorrect username and/or password"
      render :new
    end
  end

  def destroy
    logout!
    flash[:alert] = "Logged Out"
    redirect_to root_url
  end
end
