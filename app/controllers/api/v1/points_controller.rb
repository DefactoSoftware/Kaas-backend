module Api
  module V1
    class PointsController < ApplicationController
      def index
        if params[:user_id]
          points = Point.where(user_id: params[:user_id])
          total = 0
          points.each do |point|
            total += point.amount
          end
          render json: total
        end
      end
    end
  end
end
