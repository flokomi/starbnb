class Spaceship < ApplicationRecord
  belongs_to :user
  has_many :reservations, dependent: :delete_all
  has_many_attached :photos, dependent: :delete_all

  validates :name, presence: true, uniqueness: true
  validates :price, presence: true
  validates :description, presence: true
  validates :capacity, presence: true
end
