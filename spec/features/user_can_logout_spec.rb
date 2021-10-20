require 'rails_helper'

RSpec.feature "Timeline", type: :feature do
  scenario "user can logout" do
    signup("Bob")
    logout()
    expect(page).to have_content("You are now logged out")
  end
end