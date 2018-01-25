class SessionsController < ApplicationController
  def new
  end
  def create
    @user = User.find_by(email: params[:session][:email])
    if @user && @user.authenticated?(params[:session][:password])
      flash[:success] = 'You are now logged in'
      log_in(@user)
      redirect_to @user
    else
      render 'new'
    end
  end
  def destroy
    flash[:success] = "You have logged out"
    log_out
    redirect_to root_url
  end
end
