module Api
  module V1
    class QuestionsController < ApplicationController
      def create
        category = Category.where(name: question_parameters[:category_name])
        if category.length == 1
          question = Question.new(user_id: question_parameters[:user_id], question: question_parameters[:question], category_id: category[0].id, time_limit: question_parameters[:time_limit] || 0)
        end

        if question.save!
          Point.create(user_id: question_parameters[:user_id], amount: 1)
          render json: question
        else
          render json: question.errors, status: :unprocessable_entity
        end

        send_requests(question)
      end

      def update
        question = Question.find(params[:id])
        if question.update_attributes!(question_parameters)
          request = Request.where(user_id:question_parameters[:user_answer_id], question_id: params[:id])
          if request.length == 1
            request[0].delete
          end
          question.send_push_notification
          render json: question
        else
          render json: question.errors, status: :unprocessable_entity
        end
      end

      def show
        question = Question.find(params[:id])

        if question
          render json: question
        end
      end

      def index
        if params[:user_id]
          questions = Question.where(user_id: params[:user_id])
        else
          questions = Question.all
        end

        render json: questions
      end

      private
      def question_parameters
        params.require(:question).permit(:question, :user_id, :category_name, :answer, :user_answer_id, :time_limit)
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
