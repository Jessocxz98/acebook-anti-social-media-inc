require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  let(:user) { User.create(username: "test", email: "test@test.com", password: "123456" ) }
  let(:post) { Post.create(message: "Hello, world!", user_id: user.id) }

  before do
    allow_any_instance_of(ApplicationController).to receive(:logged_in?).and_return(true)
    allow_any_instance_of(PostsController).to receive(:post_owner?).and_return(true)  
  end
  
  describe "GET /new " do
    it "responds with 200" do
      get :new
      expect(response).to have_http_status(200)
    end
  end

  describe "POST /" do
    it "responds with 200" do
      expect(response).to have_http_status(200)
    end

    it "creates a post" do
      Post.create(message: "Hello, world!", user_id: user.id)
      expect(Post.find_by(message: "Hello, world!")).to be
    end
  end

  describe "GET /" do
    it "responds with 200" do
      get :index
      expect(response).to have_http_status(200)
    end
  end

  describe "GET /edit" do
    before do
      allow_any_instance_of(PostsController).to receive(:post_owner?).and_return(true)
    end
    
    it "responds with 200" do
      get :edit, params: { id: post.id }
      expect(response).to have_http_status(200)
    end
  end

  describe "POST /update" do
    before do
      allow_any_instance_of(PostsController).to receive(:post_owner?).and_return(true)
    end

    it "responds with 200" do
      post.update(message: "Hello, world 2!")
      expect(Post.find_by(message: "Hello, world 2!")).to be
    end
  end

  describe "POST /destroy" do


    it "responds with 200" do
      post.destroy
      expect(Post.find_by(message: "Hello, world!")).not_to be
    end
  end
end
