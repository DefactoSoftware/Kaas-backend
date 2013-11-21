# == Schema Information
#
# Table name: requests
#
#  id          :integer          not null, primary key
#  user_id     :integer
#  question_id :integer
#  time_limit  :integer
#  created_at  :datetime
#  updated_at  :datetime
#

class Request < ActiveRecord::Base
  belongs_to :user
  belongs_to :question
  after_create :send_push_notification

  def send_push_notification
    device = Device.where(user_id: user_id).first
    if device
      notification = {
        :device_tokens => [device.token],
        :aps => {
          :alert => 'You have a new question!',
          :badge => 1,
          question_id: question_id
        }
      }
      Urbanairship.push(notification)
    end
  end
end
