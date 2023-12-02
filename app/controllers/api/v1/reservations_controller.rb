class Api::V1::ReservationsController < ApplicationController
  def index
    @reservation = Reservation.all
    render json: @reservations
  end

  def new
    @reservation = Reservation.new
  end
  
  def create
    @reservation = @current_user.appointments.build(appointment_params)
    
    if @reservation.save
      render json: reservation, status: :created
    else
      render json: reservation.errors, status: :unprocessable_entity
    end
  end

  def update
    respond_to do |format|
      if @reservation.update(reservation_params)
        render json: reservation, status: :updated
      else
        render json: reservation.errors, status: :unprocessable_entity
  end

  def destroy
    @reservation.destroy

    respond_to do |format|
      render json: reservation, status: :destroyed
      render json: reservation.errors, status: :unprocessable_entity 
  end

  private

  def reservation_params
    params.require(:reservation).permit(:reservation_id, :doctor_id, :time, :date, :text)
  end
end