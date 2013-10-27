module Api
  module V1
    class AnswerablesController < ApplicationController

    def index
      if params[:user_id]
        requests = Request.where(user_id: params[:user_id])
        questions = []
        requests.each do |request|
          questions << Question.find_by_id(request.question_id)
        end
      end

      render json: questions.reverse, each_serializer: AnswerableSerializer
    end

    end
  end
end
