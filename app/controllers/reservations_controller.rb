class ReservationsController < ApplicationController
  def create
    @reservation = Reservation.new(reservation_params)
    @reservation.user = current_user
    @spaceship = Spaceship.find(params[:spaceship_id])
    @reservation.spaceship = @spaceship

    set_end_price_in_reservation

    if @reservation.save
      redirect_to dashboard_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def dashboard
    @spaceships = Spaceship.where("user_id = #{current_user.id}")
    @reservations = Reservation.where("user_id = #{current_user.id}")
    @reservations_all = Reservation.all
    @spaceships_all = Spaceship.all
  end

  private

  def reservation_params
    params.require(:reservation).permit(:start_date, :end_date, :total_guests, :price)
  end

  def set_end_price_in_reservation
    end_of = Date.parse(params[:reservation][:end_date])
    start_of = Date.parse(params[:reservation][:start_date])
    num_of_days = (end_of - start_of).to_i
    @reservation.price = num_of_days * @spaceship.price
  end
end
