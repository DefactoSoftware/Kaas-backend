# == Schema Information
#
# Table name: user_categories
#
#  id          :integer          not null, primary key
#  user_id     :integer
#  category_id :integer
#  created_at  :datetime
#  updated_at  :datetime
#

class UserCategory < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
end
