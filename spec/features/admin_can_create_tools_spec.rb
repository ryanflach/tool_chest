require 'rails_helper'

RSpec.feature "Admin can create tools" do
  scenario "A logged-in admin views the tools page" do
    admin = User.create(username: 'Admin', password: 'password', role: 1)
    user = User.create(username: 'Ryan', password: 'simple', role: 0)
    Category.create(name: 'Tools')
    Category.create(name: 'Plumbing')
    ApplicationController.any_instance.stubs(:current_user).returns(admin)

    visit tools_path
    click_on "Create New Tool"
    fill_in "Name", with: "Hammer"
    fill_in "Price", with: 9.99
    fill_in "Quantity", with: 1
    select 'Tools', from: 'Category'
    select 'Ryan', from: 'User'
    click_button "Create Tool"

    expect(page).to have_content("Hammer")
  end
end
