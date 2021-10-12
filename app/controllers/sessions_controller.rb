class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:notice] = "Logged in"
      redirect_to posts_url
    else
      flash[:alert] = "Not logged in"
      redirect_to login_url
    end
  end

end