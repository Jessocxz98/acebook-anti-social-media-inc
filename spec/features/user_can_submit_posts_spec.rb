require 'rails_helper'

RSpec.feature "Timeline", type: :feature do
  scenario "Can submit posts and view them" do
    visit "/"
    click_link "Log in"
    click_link "Sign up"
    fill_in "username", with: "Bob"
    fill_in "email", with: "Bob@test.com"
    fill_in "password", with: "123456"
    click_button "Sign up"
    click_link "Add post"
    fill_in "Message", with: "Bob's your uncle!"
    click_button "Add post"
    expect(page).to have_content("Bob's your uncle!")
  end
end