require 'rails_helper'

RSpec.feature "User can log in" do
  context "with valid login" do
    scenario "they view the page for all tools" do
      user = User.create(username: 'Ryan', password: 'password')
      user.tools.create(name: "Hacksaw", price: 19.99, quantity: 3)

      visit tools_path

      click_on "Login"
      fill_in "session[username]", with: "Ryan"
      fill_in "session[password]", with: "password"
      click_button "Login"

      expect(current_path).to eq(tools_path)
      expect(page).to have_content("Successfully logged in!")
      expect(page).to have_content("Welcome, Ryan!")
      expect(page).to have_link("Hacksaw", href: tool_path(user.tools.first))
    end
  end

  context "with invalid login" do
    scenario "they view the page for all tools" do
      user = User.create(username: 'Ryan', password: 'password')

      visit tools_path

      click_on "Login"
      fill_in 'session[username]', with: 'Ryan'
      fill_in 'session[password]', with: 'incorrect'
      click_button "Login"

      expect(current_path).to eq(login_path)
      expect(page).to have_content("Invalid username or password")
    end

  end
end
