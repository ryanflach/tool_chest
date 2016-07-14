require 'rails_helper'

describe "Create new tool", :type => :feature do
  scenario "User creates a new tool" do
    visit new_tool_path
    # same as: visit "/tools/new"

    fill_in "Name", :with => "Screwdriver"
    fill_in "Price", :with => 9.99
    fill_in "Quantity", :with => 5
    click_button "Create Tool"

    expect(current_path).to eq(tools_path)

    within("table tbody") do
      expect(page).to have_content("Screwdriver")
      expect(page).to have_content("9.99")
      expect(page).to have_content("5")
    end
  end
end
