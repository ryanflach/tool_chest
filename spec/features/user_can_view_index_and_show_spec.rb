require 'rails_helper'

RSpec.feature "User can view index and show page" do
  scenario "Logged-in user can view their own tools" do
    user = User.create(username: 'Ryan', password: 'password')
    user.tools.create(name: 'Hammer', price: 9.99, quantity: 2)
    user.tools.create(name: 'Chainsaw', price: 399.99, quantity: 1)
    Tool.create(name: "Hacksaw", price: 19.99, quantity: 2)


    ApplicationController.any_instance.stubs(:current_user).returns(user)

    visit tools_path

    within("tbody") do
      expect(page).to have_link("Hammer", href: tool_path(user.tools.first))
      expect(page).to have_link("Chainsaw", href: tool_path(user.tools.last))
    end
  end

  scenario "Logged-in user can view a tool's show page" do
    user = User.create(username: 'Ryan', password: 'password')
    user.tools.create(name: 'Hammer', price: 9.99, quantity: 2)

    ApplicationController.any_instance.stubs(:current_user).returns(user)

    visit tools_path

    click_link "Hammer"

    expect(current_path).to eq(tool_path(user.tools.first))
  end
end
