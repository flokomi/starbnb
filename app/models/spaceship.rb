class Spaceship < ApplicationRecord
  belongs_to :user
  has_many :reservations

  validates :name, presence: true, uniqueness: true
  validates :price, presence: true
  validates :capacity, presence: true
end
