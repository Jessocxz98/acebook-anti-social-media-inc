require 'rails_helper'

RSpec.feature "Timeline", type: :feature do
  scenario "Can submit posts and view them" do
    visit "/users/new"
    fill_in "username", with: "test"
    fill_in "email", with: "test@test.com"
    fill_in "password", with: "123456"
    click_button "Sign up"

    visit "/posts"
    click_link "Add post"
    fill_in "Message", with: "Hello, world!"
    # find("#post_user_id", visible: false).set(1)
    # fill_in "User_id", with: 1
    click_button "Add post"
    expect(page).to have_content("Hello, world!")
  end
end

