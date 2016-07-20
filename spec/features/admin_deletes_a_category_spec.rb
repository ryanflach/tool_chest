require 'rails_helper'

RSpec.feature "Admin deletes a category" do
  scenario "logged-in admin visits a category's page" do
    admin = User.create(username: 'Ryan', password: 'password', role: 1)
    category = Category.create(name: "Plumbing")

    ApplicationController.any_instance.stubs(:current_user).returns(admin)

    visit admin_category_path(category)

    click_link "Delete"

    expect(current_path).to eq(admin_categories_path)
    expect(page).not_to have_link("Plumbing", href: admin_category_path(category))
  end
end
