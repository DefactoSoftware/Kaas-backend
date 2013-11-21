
class CategorySerializer < ActiveModel::Serializer
  include ActionView::Helpers::DateHelper
  attributes :id, :name
end
