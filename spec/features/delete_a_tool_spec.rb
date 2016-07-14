require 'rails_helper'

describe "Delete a tool", :type => :feature do
  scenario "User deletes a tool" do
    Tool.create(name: "Screwdriver", price: 9.99, quantity: 5)

    visit tools_path

    within("table tbody") do
      expect(page).to have_content("Screwdriver")
    end

    click_link "Screwdriver"
    click_link "Delete Tool"

    expect(current_path).to eq(tools_path)

    within("table tbody") do
      expect(page).not_to have_content("Screwdriver")
    end
  end
end
