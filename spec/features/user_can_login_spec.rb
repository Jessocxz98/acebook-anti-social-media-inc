require 'rails_helper'

RSpec.feature "Timeline", type: :feature do
  scenario "user can login" do
    signup("Bob")
    logout()
    fill_in "login_email", with: "Bob@test.com"
    fill_in "login_password", with: "123456"
    click_button "Log in"
    expect(page).to have_content("Logged in successfully")
  end
end