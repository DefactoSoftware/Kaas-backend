module Api
  module V1
    class AnswersController < ApplicationController

    def index
      if params[:user_id]
        questions = Question.where(user_answer_id: params[:user_id])
        output_questions = []
        questions.each do |question|
          if question.answer != nil
            output_questions << question
          end
        end
      end

      render json: output_questions
    end

    end
  end
end
