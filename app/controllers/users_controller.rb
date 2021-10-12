class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(post_params)
    if @user.save
      flash[:notice] = 'Welcome to the app'
      redirect_to posts_url
    else
      redirect_to users_new_url
      flash[:notice] = "Something wrong happened"
    end
  end

  def index
    @user = User.all
  end

  private

  def post_params
    params.require(:user).permit(:username, :email, :password)
  end

end
