class SpaceshipsController < ApplicationController
  def index
    @spaceships = Spaceship.all
  end

  def show
    @reservation = Reservation.new
    @spaceship = Spaceship.find(params[:id])
  end
end
