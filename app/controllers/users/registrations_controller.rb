# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  include RackSessionFix
  respond_to :json

  def new
    render json: {
      status: { code: 200, message: 'Welcome to the user sign-up endpoint. Use POST request to create a new user.' }
    }, status: :ok
  end

  def create
    build_resource(sign_up_params)

    if resource.save
      render json: {
        status: { code: 200, message: 'Signed up successfully.' },
        data: UserSerializer.new(resource).serializable_hash[:data][:attributes]
      }, status: :ok
    else
      render json: {
        status: { code: 422, message: "User couldn't be created. #{resource.errors.full_messages.to_sentence}" }
      }, status: :unprocessable_entity
    end
  end

  private

  def respond_with(resource, _opts = {})
    if request.method == 'POST' && resource.persisted?
      render json: {
        status: { code: 200, message: 'Signed up successfully.' },
        data: UserSerializer.new(resource).serializable_hash[:data][:attributes]
      }, status: :ok
    elsif request.method == 'DELETE'
      render json: {
        status: { code: 200, message: 'Account deleted successfully.' }
      }, status: :ok
    else
      render json: {
        status: { code: 422,
                  message: "User couldn't be created successfully. #{resource.errors.full_messages.to_sentence}" },
        errors: resource.errors.full_messages
      }, status: :unprocessable_entity
    end
  end
end
