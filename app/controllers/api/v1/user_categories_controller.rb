module Api
  module V1
    class UserCategoriesController < ApplicationController
      def create
        category = Category.find_or_create_by(name: user_category_parameters[:name])
        user_category = UserCategory.new(user_id: user_category_parameters[:user_id], category: category)

        if user_category.save!
          render json: user_category
        else
          render json: user_category.errors, status: :unprocessable_entity
        end
      end

      private
      def user_category_parameters
        params.require(:user_category).permit(:user_id, :name)
      end
    end
  end
end
