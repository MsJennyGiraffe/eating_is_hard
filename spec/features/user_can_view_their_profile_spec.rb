require 'rails_helper'

RSpec.feature "user can view their profile" do
  scenario "a logged in user can view their profile" do
    visit "/"
    click_link "Login with Facebook"
    click_link "Profile"

    expect(page).to have_content("Jenny")
    expect(page).to have_content("test@test.com")
    expect(page).to have_content("Add Likes")
    expect(page).to have_content("Add Dislikes")
    expect(page).to have_content("Favorite Recipes")
  end
end
