class UserSerializer < ActiveModel::Serializer
  include ActionView::Helpers::DateHelper
  attributes :id, :name, :email, :total_points

  def total_points
    object.total_points
  end
end
