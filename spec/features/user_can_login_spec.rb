require 'rails_helper'

RSpec.feature "Timeline", type: :feature do
  scenario "user can login" do
    visit "/"
    click_link "Log in"
    click_link "Sign up"
    fill_in "username", with: "Bob"
    fill_in "email", with: "Bob@test.com"
    fill_in "password", with: "123456"
    click_button "Sign up"
    click_link "Log out"
    fill_in "login_email", with: "Bob@test.com"
    fill_in "login_password", with: "123456"
    click_button "Log in"
    expect(page).to have_content("Logged in successfully")
  end
end