require 'rails_helper'

RSpec.feature "user can favorite recipes" do
  scenario "A logged in user can favorite recipes" do
      VCR.use_cassette("user favorites", :record => :new_episodes) do
      visit '/'
      click_link "Login with Facebook"
      click_link "Profile"

      within(".favorites") do
        expect(page).to have_selector(".recipe", count: 0)
      end

      visit "/"
      click_link "Generate Recipes"
      click_on "1"
      click_link "Favorite Recipe"

      within(".favorites") do
        expect(page).to have_selector(".recipe", count: 1)
      end
    end
  end
end
