class CommentsController < ApplicationController
  before_action :set_post

  def create
    @comment = @post.comments.create(comment_params)
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :post_id, :user_id)
  end

  def set_post
    @post = Post.find(params[:post_id])
  end
end
