class ApplicationController < ActionController::API
  include CanCan::ControllerAdditions

  rescue_from CanCan::AccessDenied do |exception|
    render json: { error: 'Access denied', message: exception.message }, status: :forbidden
  end

  private

  def authenticate_user!
    authorization_header = request.headers['Authorization']
    
    unless authorization_header
      render json: { error: 'Missing authorization header' }, status: :unauthorized
      return
    end

    token = authorization_header.split(' ').last
    decoded_token = decode_token(token)

    if decoded_token && user = User.find_by(id: decoded_token['user_id'])
      sign_in user, store: true
      @current_user = user
    else
      render json: { error: 'Invalid authentication token' }, status: :unauthorized
    end
  end

  def decode_token(token)
    begin
      JWT.decode(token, Rails.application.secret_key_base)[0]
    rescue JWT::DecodeError
      nil
    end
  end

  def current_user
    @current_user
  end
end

