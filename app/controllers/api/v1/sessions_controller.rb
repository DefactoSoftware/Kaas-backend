module Api
  module V1
    class SessionsController < ApplicationController
      def create
        user = User.where(email: user_parameters[:email]).last
        if user
          render json: user, serializer: UserSerializer
        else
          render status: :unauthorized
        end
      end

      private
      def user_parameters
        params.require(:user).permit(:email)
      end
    end
  end
end


