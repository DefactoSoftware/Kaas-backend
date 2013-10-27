class AnswerableSerializer < ActiveModel::Serializer
  attributes :id, :category_name, :question, :time_limit

  def category_name
    object.category.name
  end
end
