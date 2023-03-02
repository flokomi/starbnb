class Spaceship < ApplicationRecord
  belongs_to :user
  has_many :reservations
  has_one_attached :photo

  validates :name, presence: true, uniqueness: true
  validates :price, presence: true
  validates :capacity, presence: true
end
