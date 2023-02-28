class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :spaceship

  validates :start_date, :end_date, :price, :total_guests, presence: true
end
