require "rails_helper"

RSpec.feature "user can like food" do
  scenario "a logged in user likes food" do
    Ingredient.create(name: "Chicken")
    Ingredient.create(name: "Shrimp")

    visit "/"
    click_link "Login with Facebook"
    click_link "Profile"
    click_link "Add Likes"

    expect(page).to_not have_css(".likes")

    click_on "Ingredients"
    click_on "Shrimp"

    within(".likes") do
      expect(page).to have_content("Shrimp")
      expect(page).to_not have_content("Chicken")
    end
  end
end
