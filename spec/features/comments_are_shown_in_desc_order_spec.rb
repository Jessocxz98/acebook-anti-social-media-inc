require 'rails_helper'

RSpec.feature "Timeline", type: :feature do
  scenario "commenst are shown in desc order" do
    signup("Bob")
    click_link "Add post"
    fill_in "Message", with: "Bob's your uncle!"
    click_button "Add post"
    fill_in "comment[content]", with: "First comment"
    click_button "Add comment"
    fill_in "comment[content]", with: "Second comment"
    click_button "Add comment"
    expect("Second comment").to appear_before("First comment")
  end
end