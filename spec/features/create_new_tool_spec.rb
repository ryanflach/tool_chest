require 'rails_helper'

describe "Create new tool", :type => :feature do
  scenario "User creates a new tool" do
    category = Category.create(name: "Tools")
    visit new_tool_path
    # same as: visit "/tools/new"
    fill_in "Name", :with => "Screwdriver"
    fill_in "Price", :with => 9.99
    fill_in "Quantity", :with => 5
    select 'Tools', :from => 'Category'
    click_button "Create Tool"

    expect(current_path).to eq(tool_path(Tool.last))

    within("table tbody") do
      expect(page).to have_content("Screwdriver")
      expect(page).to have_content("9.99")
      expect(page).to have_content("5")
      expect(page).to have_content("Tools")
    end
  end
end
