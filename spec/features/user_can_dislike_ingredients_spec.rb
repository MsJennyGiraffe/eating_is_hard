require "rails_helper"

RSpec.feature "user can dislike food" do
  scenario "a logged in user dislikes food" do
    Ingredient.create(name: "Chicken")
    Ingredient.create(name: "Shrimp")

    visit "/"
    click_link "Login with Facebook"
    click_link "Profile"
    click_link "Add Likes/Dislikes"

    expect(page).to_not have_css(".dislikes")

    click_on "Add Ingredients to Dislike"
    within (".add-dislike") do
      click_on "Shrimp"
    end

    within(".dislikes") do
      expect(page).to have_content("Shrimp")
      expect(page).to_not have_content("Chicken")
    end
  end

  scenario "a logged in user cannot dislike the same food twice" do
    Ingredient.create(name: "Chicken")
    Ingredient.create(name: "Shrimp")

    visit "/"
    click_link "Login with Facebook"
    click_link "Profile"
    click_link "Add Likes/Dislikes"

    expect(page).to_not have_css(".dislikes")

    click_on "Add Ingredients to Dislike"
    within (".add-dislike") do
      click_on "Shrimp"
    end

    within(".dislikes") do
      expect(page).to have_content("Shrimp")
      expect(page).to_not have_content("Chicken")
    end

    click_on "Add Ingredients to Dislike"
    within (".add-dislike") do
      click_on "Shrimp"
    end

    expect(page).to have_content("You've already disliked this ingredient")
    expect(page).to have_selector('.dislikes', count: 1)
  end
end
