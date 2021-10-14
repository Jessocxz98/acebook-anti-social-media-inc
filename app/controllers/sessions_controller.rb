class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
        session[:user_id] = user.id
        flash[:notice] = "Logged in successfully"
        redirect_to posts_url
    else
        flash.now[:alert] = "There was something wrong with your login details"
        render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "You are now logged out"
    redirect_to login_url
  end
end
