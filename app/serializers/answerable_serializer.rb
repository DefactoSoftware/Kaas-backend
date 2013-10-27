
class AnswerableSerializer < ActiveModel::Serializer
  include ActionView::Helpers::DateHelper
  attributes :id, :category_name, :question, :time_limit, :time_ago_string

  def time_ago_string
    time_ago_in_words(object.created_at)
  end

  def category_name
    object.category.name
  end
end
