class ReservationsController < ApplicationController
  def create
    @reservation = Reservation.new(reservation_params)
    @user = User.last
    @reservation.user = @user
    @spaceship = Spaceship.find(params[:spaceship_id])
    @reservation.spaceship = @spaceship
    if @reservation.save
      redirect_to spaceship_path(@reservation)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def reservation_params
    params.require(:reservation).permit(:start_date, :end_date, :total_guests, :price)
  end
end
