module Api
  module V1
    class DevicesController < ApplicationController
      def create
        device = Device.new(device_parameters)

        if device.save!
          render json: device
        else
          render json: device.errors, status: :unprocessable_entity
        end

      end

      private
      def device_parameters
        params.require(:devices).permit(:user_id)
      end

    end
  end
end
