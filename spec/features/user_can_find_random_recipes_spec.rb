require 'rails_helper'

RSpec.feature "user can generate random recipes" do
  scenario "a user can generate recipes" do
    VCR.use_cassette("user random recipes") do
      visit "/"
      click_link "Generate Recipes Now"

      expect(current_path).to eq("/recipes")

      click_on "3"

      expect(page).to have_selector('.recipe', count: 3)
    end
  end
end
