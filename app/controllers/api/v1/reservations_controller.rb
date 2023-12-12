class Api::V1::ReservationsController < ApplicationController
  # before_action :authenticate_user!
  before_action :set_reservation, only: %i[show update destroy]

  # my reservation
  def index
    current_user_id = params[:user_id]
    user = User.find(current_user_id)
    @reservations = user.reservations.includes(:doctor)
    render json: { reservations: @reservations.as_json(include: { doctor: { only: [:id, :name] } }) }
  end
  
  # all reservation for admin
  def getAll
    @reservations = Reservation.includes(:user, :doctor).all
    render json: {
      reservations: @reservations.as_json(
        include: {
          user: { only: [:id, :name, :email] }, # Add more attributes as needed
          doctor: { only: [:id, :name, :specialization] } # Add more attributes as needed
        }
      )
    }
  end

  def show
    render json: @reservation
  end

  def create
    @reservation = Reservation.new(reservation_params)

    if @reservation.save
      render json: @reservation, status: :created
    else
      render json: @reservation.errors, status: :unprocessable_entity
    end
  end

  def update
    respond_to do |_format|
      if @reservation.update(reservation_params)
        render json: reservation, status: :updated
      else
        render json: reservation.errors, status: :unprocessable_entity
      end
    end
  end

  def destroy
    @reservation.destroy
  
    if @reservation.destroyed?
      render json: { message: 'Reservation destroyed successfully' }, status: :ok
    else
      render json: { errors: @reservation.errors.full_messages }, status: :unprocessable_entity
    end
  end
    

  private

  def set_reservation
    @reservation = Reservation.find(params[:id])
  end

  def reservation_params
    params.require(:reservation).permit(:user_id, :doctor_id, :date, :time)
  end
end
