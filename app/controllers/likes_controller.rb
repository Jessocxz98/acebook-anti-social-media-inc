class LikesController < ApplicationController
  
  before_action :set_post, :set_like

  def create
    if liked?
      @like.destroy
    else
      @like = @post.likes.create(user_id: current_user.id)
    end
    respond_to do |format|
      format.js {}
      format.html{ redirect_to posts_url }
    end
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end

  def set_like
    @like = @post.likes.find_by(user_id: current_user.id, post_id: params[:post_id])
  end

  def liked?
    Like.exists?(user_id: current_user.id, post_id: params[:post_id])
  end

end