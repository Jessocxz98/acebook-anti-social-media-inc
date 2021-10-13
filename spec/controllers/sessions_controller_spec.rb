require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  describe "GET /session/new" do
    it "responds with 200" do
      get :new
      expect(response).to have_http_status(200)
    end
  end

  describe "POST /login" do
    it "session id matches with created user ID" do
      user = User.create(username: "test", email: "test@example.com", password: "password")
      post :create, params: { session: { email: "test@example.com", password: "password" } }
      expect(session[:user_id]).to eq user.id
    end

    it "can't create session" do
      User.create(username: "test", email: "test@example.com", password: "password")
      post :create, params: { session: { email: "test1@example.com", password: "password" } }
      expect(session[:user_id]).not_to be
    end
  end

  describe "DELETE /logout" do
    it "can log out" do
      user = User.create(username: "test", email: "test@example.com", password: "password")
      post :create, params: { session: { email: "test@example.com", password: "password" } }
      session.destroy
      expect(session[:user_id]).not_to be
    end
  end
end
