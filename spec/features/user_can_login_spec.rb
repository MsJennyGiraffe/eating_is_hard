require "rails_helper"

RSpec.feature "user can login" do
  scenario "a user with a facebook account can login" do
      visit "/"
      click_link "Login with Facebook"

      expect(page).to have_content("Hello, Jenny")
      expect(page).to have_content("Logout")
      expect(page).to_not have_content("Login with Facebook")
  end

  scenario "a logged in user can logout" do
    visit "/"
    click_link "Login with Facebook"

    expect(page).to have_content("Hello, Jenny")
    expect(page).to_not have_content("Login with Facebook")

    click_link "Logout"
    expect(page).to have_content("Login with Facebook")
    expect(page).to_not have_content("Hello, Jenny")
  end
end
