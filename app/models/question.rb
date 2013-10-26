class Question < ActiveRecord::Base
  def send_push_notification
    notification = {
      device_tokens: [Device.where(user_id: user_id)[0].token],
      aps: {
        alert: 'Your question has been answered!',
        badge: 1,
        question_id: id

      }
    }

    Urbanairship.push(notification)
  end
end
