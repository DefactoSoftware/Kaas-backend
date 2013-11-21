module Api
  module V1
    class DevicesController < ApplicationController
      def create
        device = Device.new(device_parameters)

        if device.save!
          register(device)
          render json: device
        else
          render json: device.errors, status: :unprocessable_entity
        end

      end

      private
      def device_parameters
        params.require(:device).permit(:user_id, :token)
      end

      def register device
        Urbanairship.register_device(device.token, alias: device.user_id)
      end
    end
  end
end
