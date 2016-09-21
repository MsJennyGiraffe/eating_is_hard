require 'rails_helper'

RSpec.feature "user gets specialized recipes" do
  scenario "A logged in user has liked ingredients" do
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
end
