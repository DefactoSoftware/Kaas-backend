# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  email      :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class User < ActiveRecord::Base
  has_many :user_categories
  has_many :questions
  has_many :requests
  has_many :points

  def total_points
    points.map(&:amount).reduce(0, :+)
  end
end
