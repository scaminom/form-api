module Api
  module V1
    class SessionsController < Devise::SessionsController
      # respond_to :json

      # Override the set_flash_message method to prevent flash-related errors
      def set_flash_message(key, kind, options = {})
      end

      # Override the require_no_authentication method to prevent flash-related errors
      def require_no_authentication
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

      def destroy
        if current_user.present?
          sign_out(current_user)
          render json: { message: 'Signed out successfully' }
        else
          render json: { message: 'No user to sign out' }, status: :unprocessable_entity
        end
      end
    end
  end
end

