class RequestsController < ActionController::Base

  def create

  end

  private
  def request_parameters
    params.require(:request).permit(:user_id, :time_limit, :question_id)

end
