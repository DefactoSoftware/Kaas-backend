class Request < ActiveRecord::Base
  belongs_to :user
  belongs_to :question
  after_create :send_push_notification

  def send_push_notification
    notification = {
      :device_tokens => [Device.where(user_id: user_id)[0].token],
      :aps => {
        :alert => 'You have a new question!',
        :badge => 1,
        question_id: question_id
      }
    }

    Urbanairship.push(notification)
  end
end
