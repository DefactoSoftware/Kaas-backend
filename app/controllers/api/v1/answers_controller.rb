module Api
  module V1
    class AnswersController < ApplicationController

    def index
      if params[:user_id]
        questions = Question.where(user_answer_id: params[:user_id])
      end

      if !questions.empty?
        render json: questions
      else
        render json: questions.errors, status: :not_found
      end
    end

    end
  end
end
