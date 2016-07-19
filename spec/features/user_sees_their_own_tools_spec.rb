require 'rails_helper'

RSpec.feature "User sees their own tools" do
  scenario "logged-in user views the tools page" do
    user = User.create(username: 'Ryan', password: 'password')
    user.tools.create(name: "Hammer", price: 9.99, quantity: 3)
    Tool.create(name: "Hacksaw", price: 19.99, quantity: 2)
    ApplicationController.any_instance.stubs(:current_user).returns(user)

    visit tools_path

    expect(page).to have_content("Hammer")
    expect(page).not_to have_content("Hacksaw")
  end
end
