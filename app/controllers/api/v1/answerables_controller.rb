module Api
  module V1
    class AnswerablesController < ApplicationController

    def index
      if params[:user_id]
        questions = Question.where(user_answer_id: params[:user_id], answer: nil)
      end

      render json: questions
    end

    end
  end
end
