class Tool < ActiveRecord::Base
  validates :name, presence: true
  validates :price, presence: true, uniqueness: { scope: :name }
  validates :quantity, presence: true

  belongs_to :user
  belongs_to :category
end
