class SpaceshipsController < ApplicationController
  def index
    @spaceships = Spaceship.all
  end

  def show
    @reservation = Reservation.new
    @spaceship = Spaceship.find(params[:id])
  end

  def new
    @spaceship = Spaceship.new
  end

  def create
    @spaceship = Spaceship.new(spaceship_params)
    @user = User.last
    @spaceship.user = @user
    if @spaceship.save
      redirect_to spaceship_path(@spaceship.id)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def spaceship_params
    params.require(:spaceship).permit(:name, :price, :capacity)
  end
end
