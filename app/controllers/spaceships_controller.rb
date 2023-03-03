class SpaceshipsController < ApplicationController
  def index
    if params[:query].present?
      sql_query = <<~SQL
        spaceship.name ILIKE :query
      SQL
      spaceships = Spaceship.joins(:user).where("spaceships.name LIKE ? OR users.name LIKE ?", "%#{"write some search term here"}%", "%#{"write user name here"}%")

      @spaceships = Spaceship.joins(:user).where(sql_query, query: "%#{params[:query]}%")
      raise
    else
      @spaceships = Spaceship.all
    end
  end

  def show
    @reservation = Reservation.new
    @user = current_user
    @spaceship = Spaceship.find(params[:id])
    # render json: @spaceship
  end

  def new
    @spaceship = Spaceship.new
  end

  def create
    @spaceship = Spaceship.new(spaceship_params)
    @spaceship.user = current_user
    if @spaceship.save
      redirect_to dashboard_path # spaceship_path(@spaceship.id)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @spaceship = Spaceship.find(params[:id])
  end

  def update
    @spaceship.update(spaceship_params)
    redirect_to spaceship_path(@spaceship)
  end

  def destroy
    @spaceship = Spaceship.find(params[:id])
    @spaceship.destroy
    redirect_to spaceships_path
  end

  private

  def spaceship_params
    params.require(:spaceship).permit(:name, :price, :capacity, :description, photos: [])
  end

  # def json_response(object, status = :ok)
  #   render json: object, status: status
  # end
end
