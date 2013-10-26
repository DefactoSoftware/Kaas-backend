module Api
  module V1
    class QuestionsController < ApplicationController
      def create
        question = Question.new(question_parameters)

        if question.save!
          render json: question
        else
          render json: question.errors, status: :unprocessable_entity
        end

        send_requests(question)
      end

      def update
        question = Question.find(params[:id])

        if question.update_attributes!(question_parameters)
          render json: question
        else
          render json: question.errors, status: :unprocessable_entity
        end
      end


      private
      def question_parameters
        params.require(:question).permit(:question, :user_id, :category_id, :answer, :user_answer_id)
      end

      def send_requests question
        user_categories = UserCategory.where(category_id: question.category_id)
        users = []
        user_categories.each do
          num = rand(0..user_categories.length - 1)
          users << user_categories[num]
          user_categories.delete(num)
        end

        users.each do |user|
          request = Request.new(question_id: question.id, user_id: user.user_id)
          request.save
        end
      end

    end
  end
end
