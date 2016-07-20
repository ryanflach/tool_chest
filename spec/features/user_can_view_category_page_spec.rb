require 'rails_helper'

RSpec.feature "User can view category page" do
  scenario "they visit their tools page" do
    user = User.create(username: 'Ryan', password: 'password')
    category = Category.create(name: 'Tools')
    user.tools.create(name: 'Hammer', price: 9.99, quantity: 1, category: category)
    ApplicationController.any_instance.stubs(:current_user).returns(user)

    visit tools_path

    click_link "Tools"

    expect(page).to have_link("Hammer", href: tool_path(user.tools.first))
    expect(page).not_to have_link("Create Category", href: new_admin_category_path)
    expect(page).not_to have_link("Edit", href: edit_admin_category_path(category))
    expect(page).not_to have_link("Delete", href: admin_category_path(category))
  end
end
