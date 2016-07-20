require 'rails_helper'

RSpec.feature "Admin can create a category" do
  scenario "logged-in admin visits the categories page" do
    admin = User.create(username: 'Admin', password: 'password', role: 1)
    ApplicationController.any_instance.stubs(:current_user).returns(admin)

    visit admin_categories_path

    click_on "Create New Category"

    fill_in "Name", with: "Plumbing"
    click_button "Create Category"

    expect(page).to have_content("Plumbing")
  end
end
