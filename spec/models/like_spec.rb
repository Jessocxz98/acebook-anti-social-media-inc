require 'rails_helper'

RSpec.describe Like, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end

describe 'post can be liked' do
  let(:user){ User.create(username: "test", email: "test@example.com", password: "password") }
  let(:user2){ User.create(username: "test2", email: "test2@example.com", password: "password2") }
  let(:post){ Post.create(message: "hello, world", user_id: user.id) }

  it 'should enter the like in the database' do
    like = Like.create(user_id: user.id, post_id: post.id)
    expect(post.likes[0].id).to eq like.id
  end
  it 'should increase like count by 1' do
    Like.create(user_id: user.id, post_id: post.id)
    expect(post.likes.count).to eq 1
  end
  it 'can only be liked once by the same user' do
    Like.create(user_id: user.id, post_id: post.id)
    Like.create(user_id: user.id, post_id: post.id)
    expect(post.likes.count).to eq 1
  end
  it 'can be liked by multiple users' do
    Like.create(user_id: user.id, post_id: post.id)
    Like.create(user_id: user2.id, post_id: post.id)
    expect(post.likes.count).to eq 2
  end
end
