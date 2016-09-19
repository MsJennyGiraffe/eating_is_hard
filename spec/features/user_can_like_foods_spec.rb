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

    click_on "Add Ingredients to Like"
    within (".add-like") do
      click_on "Shrimp"
    end

    within(".likes") do
      expect(page).to have_content("Shrimp")
      expect(page).to_not have_content("Chicken")
    end
  end

  scenario "a user cannot like the same ingredient twice" do
    Ingredient.create(name: "Chicken")
    Ingredient.create(name: "Shrimp")

    visit "/"
    click_link "Login with Facebook"
    click_link "Profile"
    click_link "Add Likes"

    expect(page).to_not have_css(".likes")

    click_on "Add Ingredients to Like"
    within (".add-like") do
      click_on "Shrimp"
    end

    within(".likes") do
      expect(page).to have_content("Shrimp")
      expect(page).to_not have_content("Chicken")
    end

    click_on "Add Ingredients to Like"
    within (".add-like") do
      click_on "Shrimp"
    end

    expect(page).to have_content("You've already liked this ingredient")
    expect(page).to have_selector('.likes', count: 1)
  end
end
