require 'rails_helper'

RSpec.feature "user gets specialized recipes" do
  scenario "A logged in user has a liked ingredient" do
    VCR.use_cassette("user likes ingredients for recipe", :record => :new_episodes) do
      Ingredient.create(name: "Chicken")
      Ingredient.create(name: "Shrimp")

      visit "/"
      click_link "Login with Facebook"
      click_link "Profile"
      click_link "Add Likes/Dislikes"
      within (".add-like") do
        click_on "Shrimp"
      end

      visit "/recipes"
      click_on "1"

      within(".recipe") do
        expect(page).to have_content("Shrimp")
      end
    end
  end

  scenario "a user has multiple liked ingredients" do
    VCR.use_cassette("user likes ingredients for recipe", :record => :new_episodes) do
      Ingredient.create(name: "Chicken")
      Ingredient.create(name: "Shrimp")
      Ingredient.create(name: "Beef")

      visit "/"
      click_link "Login with Facebook"
      click_link "Profile"
      click_link "Add Likes/Dislikes"
      within (".add-like") do
        click_on "Shrimp"
        click_on "Chicken"
      end

      visit "/recipes"
      click_on "3"

      chicken_or_shrimp = page.has_content?("Shrimp") || page.has_content?("Chicken")

      expect(chicken_or_shrimp).to be(true)
    end
  end
end
