require 'rails_helper'

RSpec.feature "Timeline", type: :feature do
  scenario "user can submit a post and view it" do
    signup("Bob")
    click_link "Add post"
    fill_in "Message", with: "Bob's your uncle!"
    click_button "Add post"
    expect(page).to have_content("Bob's your uncle!")
  end
end