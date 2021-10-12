require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  before do
    user = User.create(username: "test", email: "test@example.com", password: "password")
  end

  describe "GET /session/new" do
    it "responds with 200" do
      get :new
      expect(response).to have_http_status(200)
    end
  end

  describe "POST /login" do
    it "responds with 200" do
      post :create, params: { email: "test@example.com", password: "password" }
      expect(response).to redirect_to(posts_url)
    end

    it "can't create session" do
      post :create, params: { session: { email: "test1@example.com", password: "password" } }
      expect(response).to redirect_to(login_url)
    end
  end
end
