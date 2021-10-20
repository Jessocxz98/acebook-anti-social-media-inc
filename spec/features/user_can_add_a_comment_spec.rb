require 'rails_helper'

RSpec.feature "Timeline", type: :feature do
  scenario "user can signup" do
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
    first(".comment-form").fill_in "comment[content]", with: "and this is a comment"
    click_button "Add comment"
    expect(page).to have_content("and this is a comment")
  end
end