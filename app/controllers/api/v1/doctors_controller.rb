module Api
  module V1
    class DoctorsController < ApplicationController
      # before_action :authenticate_user!
      before_action :set_doctor, only: %i[show update destroy]

      def index
        @doctors = Doctor.order('created_at DESC')

        doctors_data = @doctors.map do |doctor|
          doctor_data = doctor.as_json
          doctor_data['image_url'] = doctor.image.attached? ? url_for(doctor.image) : nil
          doctor_data
        end

        render json: doctors_data
      end

      def show
        # render json: @doctor.as_json(except: %i[created_at updated_at])
        @doctor = doctor.find(params[:id])
        @doctor_data = @doctor.as_json
        @doctor_data['image_url'] = @doctor.image.attached? ? url_for(@doctor.image) : nil
        render json: @doctor_data
      end

      # Post

      def new
        @doctor = Doctor.new
      end

      def create
        @doctor = Doctor.new(doctor_params)
        @user_id = params[:doctor][:user_id]
        # @doctor.user_id = user_id

        if @doctor.save
          doctor_data = @doctor.as_json
          doctor_data['image_url'] = @doctor.image.attached? ? url_for(@doctor.image) : nil
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

      # def authenticate_user!
      #   token = request.headers['Authorization']&.split&.last
      #   user = User.find_by(token: token)

      #   if user
      #     sign_in(user, store: false)
      #   else
      #     render json: {
      #       status: 401,
      #       message: 'Unauthorized. Please log in.'
      #     }, status: :unauthorized
      #   end
      # end

      def set_doctor
        @doctor = Doctor.find(params[:id])
      end

      def doctor_params
        params.require(:doctor).permit(:user_id, :name, :specialization, :years_of_experience, :price_per_appointment,
                                       :image)
      end
    end
  end
end
