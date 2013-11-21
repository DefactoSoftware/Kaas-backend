
class UserSerializer < ActiveModel::Serializer
  include ActionView::Helpers::DateHelper
  attributes :id, :name, :email, :points

  def points
    Point.where(user: object)
  end

end
