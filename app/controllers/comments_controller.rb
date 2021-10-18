class CommentsController < ApplicationController
  before_action :set_post

  def create
    @comment = @post.comments.create(comment_params)
    respond_to do |format|
      format.js {}
      format.html{redirect_to posts_url}
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :post_id, :user_id)
  end

  def set_post
    @post = Post.find(params[:post_id])
  end
end
