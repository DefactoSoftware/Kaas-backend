module Api
  module V1
    class AnswersController < ApplicationController

    def index
      if params[:user_id]
        questions = Question.where(user_answer_id: params[:user_id])
      end

      render json: questions
    end

    end
  end
end
