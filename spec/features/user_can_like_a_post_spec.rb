require 'rails_helper'

RSpec.feature "Timeline", type: :feature do
  scenario "user can like a post" do
    signup("Bob")
    click_link "Add post"
    fill_in "Message", with: "Bob's your uncle!"
    click_button "Add post"
    click_button "like-button"
    expect(page).to have_content("1 like")
  end

  scenario "two users can like a post" do
    signup("Bob")
    click_link "Add post"
    fill_in "Message", with: "Bob's your uncle!"
    click_button "Add post"
    click_button "like-button"
    logout()
    signup("Dave")
    click_button "like-button"
    expect(page).to have_content("2 likes")
  end
end