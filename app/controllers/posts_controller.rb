class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
    redirect_to posts_url
  end

  def index
    @posts = Post.all
  end

  def like
    @post = Post.all.find(params[:id])
    Like.create(user_id: current_user.id, post_id: @post.id)
    redirect_to posts_url
  end

  private

  def post_params
    params.require(:post).permit(:message, :image, :user_id)
  end

end
