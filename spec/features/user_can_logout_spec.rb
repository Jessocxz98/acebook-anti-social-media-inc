require 'rails_helper'

RSpec.feature "Timeline", type: :feature do
  scenario "user can logout" do
    signup("Bob")
    click_link "Log out"
    expect(page).to have_content("You are now logged out")
  end
end