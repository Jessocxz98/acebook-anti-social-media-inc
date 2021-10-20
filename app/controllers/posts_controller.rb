class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
    if !!@post.wall
      redirect_to user_path(@post.wall)
    else
      redirect_to posts_url
    end
  end

  def index
    @posts = Post.where(wall: nil)
  end

  private

  def post_params
    params.require(:post).permit(:message, :image, :user_id, :wall)
  end
end
