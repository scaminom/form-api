module Api
  module V1
    class UsersController < ApplicationController
      before_action :authenticate_user!
      load_and_authorize_resource
      before_action :set_user, only: %i[ show update destroy ]
    
      def index
        @users = User.all

        @serialize_users = @users.map { |user| serialize_user(user) }
    
        render json: {
          users: @serialize_users
        }
      end
    
      def show
        authorize! :read, @user
        render json: {
          user: serialize_user(@user)
        }
      end
    
      def create
        @user = User.new(user_params)
    
        if @user.save
          render json: {
            user: serialize_user(@user)
          }, 
          status: :created
        else
          render json: @user.errors.messages, status: :unprocessable_entity
        end
      end
    
      def update
        if @user.update(user_params)
          render json: {
            user: serialize_user(@user)
          }
        else
          render json: { error: @user.errors.messages }, status: :unprocessable_entity
        end
      end
    
      def destroy
        if @user.destroy
          head :no_content
        else
          render json: { error: @user.errors.messages }, status: :unprocessable_entity
        end
      end
    
      private

        def set_user
          @user = User.find(params[:id])
        end
    
        def user_params
          params.require(:user).permit(:username, :email, :password, :role_id, :company_id)
        end

        def serialize_user(user)
          UserSerializer.new.serialize(user).to_json
        end
    end
  end
end

