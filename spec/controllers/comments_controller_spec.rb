require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
  before do
    @user = User.create(username: "BobTest", email: "BobTest@test.com", password: "secret")
    @post = Post.create(message: "This is a post", user_id: @user.id)
  end

  describe "POST /" do
    it "responds with 200" do
      post :create, params: { post_id: @post.id, comment: { content: "this is a comment", post_id: @post.id, user_id: @user.id } }
      expect(response).to redirect_to(posts_url)
    end

    it "creates a comment" do
      post :create, params: { post_id: @post.id, comment: { content: "this is another comment", post_id: @post.id, user_id: @user.id } }
      expect(Comment.find_by(content: "this is another comment")).to be
    end
  end
end