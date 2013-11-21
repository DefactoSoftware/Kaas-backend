
class CategorySerializer < ActiveModel::Serializer
  include ActionView::Helpers::DateHelper
  attributes :name
end
