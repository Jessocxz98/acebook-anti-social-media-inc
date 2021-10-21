require 'rails_helper'

RSpec.describe Like, type: :model do
  it { is_expected.to be }

  describe 'post can be liked' do
    before do
    @user = User.create(username: "BobTest", email: "BobTest@test.com", password: "secret")
    @user2 = User.create(username: "DaveTest", email: "DaveTest@test.com", password: "gossip")
    @post = Post.create(message: "This is a post", user_id: @user.id)
    end

    it 'should enter the like in the database' do
      like = Like.create(user_id: @user.id, post_id: @post.id)
      expect(@post.likes[0].id).to eq like.id
    end

    it 'should increase like count by 1' do
      Like.create(user_id: @user.id, post_id: @post.id)
      expect(@post.likes.count).to eq 1
    end

    it 'can only be liked once by the same user' do
      Like.create(user_id: @user.id, post_id: @post.id)
      Like.create(user_id: @user.id, post_id: @post.id)
      expect(@post.likes.count).to eq 1
    end
    
    it 'can be liked by multiple users' do
      Like.create(user_id: @user.id, post_id: @post.id)
      Like.create(user_id: @user2.id, post_id: @post.id)
      expect(@post.likes.count).to eq 2
    end
  end
end