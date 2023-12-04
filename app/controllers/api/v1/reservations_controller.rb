class Api::V1::ReservationsController < ApplicationController
  # before_action :authenticate_user!
  before_action :set_reservation, only: %i[show update destroy]

  def index
    current_user_id = params[:user_id]
    user = User.find(current_user_id)
    @reservation = user.reservations
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

    respond_to do |_format|
      render json: reservation, status: :destroyed
      render json: reservation.errors, status: :unprocessable_entity
    end
  end

  private

  def set_reservation
    @reservation = Reservation.find(params[:id])
  end

  def reservation_params
    params.require(:reservation).permit(:reservation_id, :doctor_id, :date)
  end
end
