class Api::V1::ReservationsController < ApplicationController
  def index
    current_user_id = params[:user_id]
    user = User.find(current_user_id)
    render json: { reservations: @reservation }
  end

  def show
    render json: @reservation
  end
  
  def create
    @reservation = Reservation.new(reservation_params)

    if @reservation.save
      render json: @reservation, status: :created, location: @reservation
    else
      render json: @reservation.errors, status: :unprocessable_entity
    end
  end

  private

  def reservation_params
    params.require(:reservation).permit(:reservation_id, :doctor_id, :date)
  end
end