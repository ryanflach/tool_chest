require 'rails_helper'

describe "View all tools", :type => :feature do
  scenario "User views all tools" do
    Tool.create(name: "Screwdriver", price: 9.99, quantity: 5)

    visit tools_path

    within("h1") do
      expect(page).to have_content("All Tools")
    end

    within("table tbody") do
      expect(page).to have_content("Screwdriver")
    end
  end
end
