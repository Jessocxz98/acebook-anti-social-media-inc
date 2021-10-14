class CommentsController < ApplicationController

  def new
    @comment = Comment.new
  end

  def create
    comment = @post.comments.create(comment_params)
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :post_id, :user_id)
  end
end
