# == Schema Information
#
# Table name: devices
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  created_at :datetime
#  updated_at :datetime
#  token      :string(255)
#

class Device < ActiveRecord::Base
  belongs_to :user
end
