module Api
  module V1
    class CategoriesController < ApplicationController
      def index
        categories = Category.all
        array = []
        categories.each do |c|
          array << c.name
        end
        render json: array
      end
    end
  end
end
