require 'rails_helper'

RSpec.describe User, type: :model do
  it { should have_many(:tools) }
  it { should validate_presence_of(:username) }
  it { should validate_uniqueness_of(:username) }
end
