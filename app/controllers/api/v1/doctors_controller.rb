module Api
  module V1
    class DoctorsController < ApplicationController
      before_action :set_doctor, only: %i[show update destroy]

      def index
        @doctors = Doctor.all
        render json: @doctors.as_json(except: %i[created_at updated_at])
      end

      def show
        render json: @doctor.as_json(except: %i[created_at updated_at])
      end

      # Post

      def new
        @doctor = Doctor.new
      end

      def create
        @doctor = Doctor.new(doctor_params)

        if @doctor.save
          render json: @doctor.as_json(except: %i[created_at updated_at]), status: :created
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

      def set_doctor
        @doctor = Doctor.find(params[:id])
      end

      def doctor_params
        params.require(:doctor).permit(:user_id, :name, :specialization, :years_of_experience, :price_per_appointment)
      end
    end
  end
end
