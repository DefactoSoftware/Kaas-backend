
class QuestionSerializer < ActiveModel::Serializer
  include ActionView::Helpers::DateHelper
  attributes :id, :category_name, :question, :answer, :time_ago_string

  def time_ago_string
    time_ago_in_words(object.created_at)
  end

  def category_name
    object.category.name
  end
end
