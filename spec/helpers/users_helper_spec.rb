require 'rails_helper'

def signup(username)
  visit "/"
  click_link "Log in"
  click_link "Sign up"
  fill_in "username", with: username
  fill_in "email", with: "#{username}@test.com"
  fill_in "password", with: "123456"
  click_button "Sign up"
end
