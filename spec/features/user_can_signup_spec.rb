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
    expect(page).to have_content("Welcome to Acebook, Bob")
  end
end