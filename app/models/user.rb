class User < ActiveRecord::Base
  has_many :user_categories
  has_many :questions
  has_many :requests
end
