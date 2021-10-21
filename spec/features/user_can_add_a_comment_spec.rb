require 'rails_helper'

RSpec.feature "Timeline", type: :feature do
  scenario "user can signup" do
    signup("Bob")
    click_link "Add post"
    fill_in "Message", with: "Bob's your uncle!"
    click_button "Add post"
    click_button "comment-button"
    fill_in "comment[content]", with: "and this is a comment"
    click_button "add-comment-button"
    expect(page).to have_content("and this is a comment")
  end
end