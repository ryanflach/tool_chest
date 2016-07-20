require 'rails_helper'

RSpec.feature "Admin updates a category" do
  scenario "logged-in admin visits an individual category page" do
    admin = User.create(username: 'Admin', password: 'password', role: 1)
    category = Category.create(name: 'Plumbing')

    ApplicationController.any_instance.stubs(:current_user).returns(admin)

    visit admin_category_path(category)

    expect(page).to have_content("Plumbing")

    click_on "Edit"
    fill_in "Name", with: "Home Improvement"
    click_button "Update Category"

    expect(page).to have_content("Home Improvement")
  end
end
