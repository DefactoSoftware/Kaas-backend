module Api
  module V1
    class CategoriesController < ApplicationController
      def index
        render json: Category.all.map { |c| c.name }
      end
    end
  end
end
