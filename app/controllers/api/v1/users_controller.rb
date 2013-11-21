module Api
  module V1
    class UsersController < ApplicationController
      def create
        user = User.new(user_parameters)
        if user.save!
          render json: user, serializer: UserSerializer
        else
          render json: user.errors, status: :unprocessable_entity
        end
      end

      private
      def user_parameters
        params.require(:user).permit(:name, :email)
      end
    end
  end
end
