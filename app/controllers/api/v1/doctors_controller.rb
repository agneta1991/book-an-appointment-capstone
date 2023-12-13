class Api::V1::DoctorsController < ApplicationController
  before_action :set_doctor, only: %i[show update destroy]

  def index
    @doctors = Doctor.order('created_at DESC')

    doctors_data = @doctors.map do |doctor|
      doctor_data = doctor.as_json
      doctor_data['image_urls'] = if doctor.images.attached?
                                    doctor.images.map { |image| url_for(image) }
                                  else
                                    []
                                  end

      doctor_data
    end

    render json: doctors_data
  end

  def show
    @doctor = doctor.find(params[:id])
    @doctor_data = @doctor.as_json
    @doctor_data['image_urls'] = @doctor.images.map? { |image| url_for(image) }
    render json: @doctor_data
  end

  # Post

  def new
    @doctor = Doctor.new
  end

  def create
    @doctor = Doctor.new(doctor_params)

    user_id = params[:doctor][:user_id]
    @doctor.user_id = user_id

    if @doctor.save
      doctor_data = @doctor.as_json
      doctor_data['image_urls'] = @doctor.images.map { |image| url_for(image) }
      render json: { doctor: doctor_data, message: 'Doctor created successfully' }, status: :created
    else
      render json: @doctor.errors, status: :unprocessable_entity
    end
  end

  # Put
  def update
    if @doctor.update(doctor_params)
      render json: @doctor.as_json(except: %i[created_at updated_at])
    else
      render json: @doctor.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @doctor.destroy
    head :no_content
  end

  private

  def authenticate_user!
    token = request.headers['Authorization']&.split&.last
    user = User.find_by(token:)

    if user
      sign_in(user, store: false)
    else
      render json: {
        status: 401,
        message: 'Unauthorized. Please log in.'
      }, status: :unauthorized
    end
  end

  def set_doctor
    @doctor = Doctor.find(params[:id])
  end

  def doctor_params
    params.require(:doctor).permit(:name, :specialization, :years_of_experience, :price_per_appointment,
                                   images: [])
  end
end
