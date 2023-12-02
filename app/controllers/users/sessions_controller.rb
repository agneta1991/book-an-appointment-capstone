# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  before_action :authenticate_user!, only: [:destroy]
  before_action :configure_sign_in_params, only: [:create]
  before_action :verify_signed_out_user, only: :destroy

  include RackSessionFix
  respond_to :json

  def configure_sign_in_params
    devise_parameter_sanitizer.permit(:sign_in, keys: [:name])
  end

  def create
    user = User.find_by(name: params[:user][:name])

    if user&.valid_password?(params[:user][:password])
      sign_in(user)
      render json: {
        status: 200,
        message: 'Logged in successfully.',
        data: UserSerializer.new(user).serializable_hash[:data][:attributes]
      }, status: :ok
    else
      render json: {
        status: 401,
        message: 'Invalid credentials.'
      }, status: :unauthorized
    end
  end

  def destroy
    signed_out = (Devise.sign_out_all_scopes ? sign_out : sign_out(resource_name))

    if signed_out
      render json: {
        status: 200,
        message: 'Logged out successfully.'
      }, status: :ok
    else
      render json: {
        status: 401,
        message: "Couldn't find an active session."
      }, status: :unauthorized
    end
  end

  private

  def respond_with(resource, _opts = {})
    render json: {
      status: { code: 200, message: 'Logged in successfully.' },
      data: UserSerializer.new(resource).serializable_hash[:data][:attributes]
    }, status: :ok
  end

  def respond_to_on_destroy
    if current_user
      render json: {
        status: 200,
        message: 'logged out successfully'
      }, status: :ok
    else
      render json: {
        status: 401,
        message: "Couldn't find an active session."
      }, status: :unauthorized
    end
  end

  def verify_signed_out_user
    # If the action is destroy, allow it to proceed without checking if the user is signed in
    return if action_name == 'destroy'

    return unless user_signed_in?

    render json: {
      status: 401,
      message: 'You are already signed in.'
    }, status: :unauthorized
  end
end
