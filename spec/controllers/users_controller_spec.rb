require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe "GET /users/new " do
    it "responds with 200" do
      get :new
      expect(response).to have_http_status(200)
    end
  end

  describe "POST /users/new" do
    it "responds with 200" do
      post :create, params: { user: { username: "test", email: "test@example.com", password: "password" } }
      expect(response).to redirect_to(posts_url)
    end

    it "creates a user" do
      post :create, params: { user: { username: "test", email: "test@example.com", password: "password" } }
      expect(User.find_by(username: "test")).to be
    end
  end
end
