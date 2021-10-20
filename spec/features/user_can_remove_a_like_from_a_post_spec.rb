require 'rails_helper'

RSpec.feature "Timeline", type: :feature do
  scenario "user can remove a like from a post" do
    signup("Bob")
    click_link "Add post"
    fill_in "Message", with: "Bob's your uncle!"
    click_button "Add post"
    click_button "Like"
    click_button "Like"
    expect(page).to have_content("0 likes")
  end
end