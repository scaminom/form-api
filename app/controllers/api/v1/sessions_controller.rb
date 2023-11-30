module Api
  module V1
    class SessionsController < Devise::SessionsController
      respond_to :json

      # Override the set_flash_message method to prevent flash-related errors
      def set_flash_message(key, kind, options = {})
        # Do nothing or log a message if needed
      end

      # Override the require_no_authentication method to prevent flash-related errors
      def require_no_authentication
        # Do nothing or log a message if needed
      end

      def create
        user = User.find_by_username(params[:username])

        if user && user.valid_password?(params[:password])
          sign_in(user)
          render json: {
            token: JWT.encode({ user_id: user.id }, Rails.application.secret_key_base),
          }
        else
          render json: { error: 'Invalid credentials' }, status: :unauthorized
        end
      end
    end
  end
end

