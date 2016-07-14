require 'rails_helper'

describe "View individual tool", :type => :feature do
  scenario "User views an individual tool" do
    tool = Tool.create(name: "Screwdriver", price: 9.99, quantity: 5)

    visit tools_path

    click_link "Screwdriver"

    expect(current_path).to eq(tool_path(tool))

    within("table tbody") do
      expect(page).to have_content("Screwdriver")
      expect(page).to have_content("9.99")
      expect(page).to have_content("5")
    end
  end
end
