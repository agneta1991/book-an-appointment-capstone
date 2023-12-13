class Api::V1::ReservationsController < ApplicationController
  before_action :set_reservation, only: %i[show update destroy]

  # my reservation
  def index
    current_user_id = params[:user_id]
    user = User.find(current_user_id)
    @reservations = user.reservations.includes(:doctor)
    render json: { reservations: @reservations.as_json(include: { doctor: { only: %i[id name] } }) }
  end

  # all reservation for admin
  def all
    @reservations = Reservation.includes(:user, :doctor).all
    render json: {
      reservations: @reservations.as_json(
        include: {
          user: { only: %i[id name email] },
          doctor: { only: %i[id name specialization] }
        }
      )
    }
  end

  def show
    render json: @reservation
  end

  def create
    doctor_id = params.dig(:reservation, :doctorId)
    user_id = params.dig(:reservation, :userId)

    @reservation = Reservation.new(reservation_params.except(:doctorName, :doctorId, :userId))

    # Set doctor and user associations
    @reservation.doctor = Doctor.find(doctor_id)
    @reservation.user_id = user_id

    if @reservation.save
      render json: @reservation, status: :created
    else
      render json: { errors: @reservation.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    respond_to do |format|
      if current_user.admin? || @reservation.user == current_user
        if @reservation.update(reservation_params)
          format.json { render json: @reservation, status: :ok }
        else
          format.json { render json: @reservation.errors, status: :unprocessable_entity }
        end
      else
        format.json { render json: { error: 'Unauthorized' }, status: :unauthorized }
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
    params.require(:reservation).permit(:user_id, :doctor_id, :date, :time, :description, :doctorName, :doctorId,
                                        :userId)
  end
end
