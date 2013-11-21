# == Schema Information
#
# Table name: questions
#
#  id             :integer          not null, primary key
#  question       :text
#  user_answer_id :integer
#  answer         :text
#  user_id        :integer
#  category_id    :integer
#  created_at     :datetime
#  updated_at     :datetime
#  time_limit     :string(255)
#

class Question < ActiveRecord::Base
  belongs_to :category
  belongs_to :user
  def send_push_notification
    device = Device.where(user_id: user_id).first
    if device
      notification = {
        device_tokens: [device.token],
        aps: {
          alert: 'Your question has been answered!',
          badge: 1,
          question_id: id
        }
      }

      Urbanairship.push(notification)
    end
  end
end
