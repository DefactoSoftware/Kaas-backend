
class UserSerializer < ActiveModel::Serializer
  include ActionView::Helpers::DateHelper
  attributes :id, :name, :email, :points

  def time_ago_string
    time_ago_in_words(object.created_at)
  end

  def category_name
    object.category.name
  end
end
