module Api
  module V1
    class RolesController < ApplicationController
      before_action :authenticate_user!
      load_and_authorize_resource
      before_action :set_role, only: %i[ show update destroy ]
    
      def index
        @roles = Role.all
    
        @serialize_roles = @roles.map { |role| serialize_role(role) }

        render json: {
          roles: @serialize_roles
        }
      end
    
      def show
        render json: {
          role: serialize_role(@role)
        }
      end
    
      def create
        @role = Role.new(role_params)
    
        if @role.save
          render json: {
            role: serialize_role(@role)
          },
          status: :created
        else
          render json: { error: @role.errors.messages }, status: :unprocessable_entity
        end
      end
    
      def update
        if @role.update(role_params)
          render json: {
            role: serialize_role(@role)
          }
        else
          render json: { error: @role.errors.messages }, status: :unprocessable_entity
        end
      end
    
      def destroy
        if @role.destroy
          head :no_content
        else
          render json: { error: @role.errors.messages }, status: :unprocessable_entity
        end
      end
    
      private
        def set_role
          @role = Role.find(params[:id])
        end
    
        def role_params
          params.require(:role).permit(:name, :description)
        end
        
        def serialize_role(role)
          RoleSerializer.new.serialize(role).to_json
        end
    end
  end
end

