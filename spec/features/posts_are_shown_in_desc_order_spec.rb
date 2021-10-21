require 'rails_helper'

RSpec.feature "Timeline", type: :feature do
  scenario "posts are shown in desc order" do
    signup("Bob")
    click_link "Add post"
    fill_in "Message", with: "Bob's your uncle!"
    click_button "Add post"
    click_link "Add post"
    fill_in "Message", with: "A second post"
    click_button "Add post"
    expect("A second post").to appear_before("Bob's your uncle!")
  end
end