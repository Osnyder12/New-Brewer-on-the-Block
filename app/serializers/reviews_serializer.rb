class ReviewsSerializer < ActiveModel::Serializer
  attributes :id, :rating, :difficulty, :comment

  has_one :beer
  has_one :user
end