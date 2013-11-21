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
