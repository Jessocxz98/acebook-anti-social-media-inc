require 'rails_helper'

RSpec.feature "Timeline", type: :feature do
  scenario "user can signup" do
    signup("Bob")
    expect(page).to have_content("Welcome to Acebook, Bob")
  end
end