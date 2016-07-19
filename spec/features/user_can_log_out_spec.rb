require 'rails_helper'

RSpec.feature "User can log out" do
  scenario "a logged-in user views the page for all tools" do
    user = User.create(username: 'Ryan', password: 'password')

    visit tools_path

    click_on "Login"
    fill_in 'Username', with: 'Ryan'
    fill_in 'Password', with: 'password'
    click_button "Login"

    expect(page).not_to have_link("Login", href: login_path)

    click_on "Logout"

    expect(current_path).to eq(root_path)
    expect(page).to have_content("Successfully logged out")
    expect(page).to have_link("Login", href: login_path)
  end
end
