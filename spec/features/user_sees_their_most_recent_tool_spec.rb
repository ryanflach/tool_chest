require 'rails_helper'

RSpec.feature "User sees their most recent tool" do
  scenario "a logged-in user sees views the tools page" do
    user = User.create(username: 'Ryan', password: 'password')
    
  end
end
