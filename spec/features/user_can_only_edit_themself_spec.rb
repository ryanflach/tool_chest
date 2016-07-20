require 'rails_helper'

RSpec.feature "User can only edit themself" do
  scenario "they view the page for their tools" do
    user = User.create(username: 'Ryan', password: 'password')

    ApplicationController.any_instance.stubs(:current_user).returns(user)

    visit tools_path

    click_on "Edit User"

    fill_in "Username", with: "Johnny5"
    fill_in "Password", with: 'password'
    click_button "Update User"

    expect(page).to have_content("Welcome, Johnny5!")
  end
end
