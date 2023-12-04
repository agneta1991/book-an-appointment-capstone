class Users::SessionsController < Devise::SessionsController
  before_action :authenticate_user!, only: [:destroy]
  before_action :configure_sign_in_params, only: [:create]

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
        token: user.token, # Include the token in the response
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
      token: resource.token, # Include the token in the response
      data: UserSerializer.new(resource).serializable_hash[:data][:attributes]
    }, status: :ok
  end

  # def respond_with(resource, _opts = {})
  #   render json: {
  #     status: { code: 200, message: 'Logged in successfully.' },
  #     data: UserSerializer.new(resource).serializable_hash[:data][:attributes]
  #   }, status: :ok
  # end

  def respond_to_on_destroy
    authorization_header = request.headers['Authorization']

    if authorization_header.present?
      jwt_payload = JWT.decode(authorization_header.split[1],
                               Rails.application.credentials.fetch(:secret_key_base)).first

      current_user = User.find(jwt_payload['sub'])

      if current_user
        render json: {
          status: { code: 200, message: 'Logged out successfully.' }
        }, status: :ok
      else
        render json: {
          status: { code: 401, message: "Couldn't find an active session." }
        }, status: :unauthorized
      end
    else
      render json: {
        status: { code: 401, message: 'Authorization header is missing.' }
      }, status: :unauthorized
    end
  end
end
