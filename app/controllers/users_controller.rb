class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def show
    @user = User.find_by(id: params[:id])
    @posts = @user.posts << Post.where(wall: @user.id)
    @post = Post.new
  end

  def create
    @user = User.new(post_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "Welcome to Acebook, #{@user.username}. Your account has been successfully created."
      redirect_to posts_url
    else
      flash.now[:alert] = "Something wrong happened"
      render 'new'
    end
  end

  def index
    @user = User.all
  end

  private

  def post_params
    params.require(:user).permit(:username, :email, :password, :avatar)
  end

end
