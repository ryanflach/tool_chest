require 'rails_helper'

describe "Edit a tool", :type => :feature do
  scenario "User edits a tool" do
    Tool.create(name: "Screwdriver", price: 9.99, quantity: 5)

    visit tools_path

    within("table tbody") do
      expect(page).to have_content("Screwdriver")
    end

    click_link "Screwdriver"
    click_link "Edit Tool"

    fill_in "Name", :with => "Rake"
    click_button "Update Tool"

    expect(current_path).to eq(tool_path(Tool.last))
    within ("table tbody") do
      expect(page).to have_content("Rake")
      expect(page).to_not have_content("Screwdriver")
    end
  end
end
