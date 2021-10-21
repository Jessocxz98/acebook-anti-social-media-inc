class PostsController < ApplicationController
  before_action :check_login, except: [:index]
  before_action :set_post, only: [:edit, :update, :destroy]
  before_action :post_owner?, only: [:edit, :update, :destroy]

  def new
    @post = Post.new
    @submit = "Add post"
  end

  def create
    @post = Post.create(post_params)
    correct_redirect
  end

  def index
    store_location
    @posts = Post.where(wall: nil)
  end

  def edit
    @submit = "Confirm edit"
  end

  def update
    @post.update(post_params)
    correct_redirect
  end

  def destroy
    @post.destroy
    redirect_to session[:return_to]
  end

  private

  def post_params
    params.require(:post).permit(:message, :image, :user_id, :wall)
  end

  def check_login
    redirect_to login_url if !logged_in?
  end

  def set_post
    @post = Post.find(params[:id])
  end

  def correct_redirect
    if !!@post.wall
      redirect_to user_path(@post.wall)
    else
      redirect_to posts_url
    end
  end

  def store_location
    session[:return_to] = request.fullpath
  end

  def post_owner?
    if current_user.id != @post.user.id
      flash[:alert] = "Stop that! You're not allowed to edit someone else's post..."
      redirect_to posts_url
    end
  end
end
