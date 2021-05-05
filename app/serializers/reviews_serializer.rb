class ReviewsSerializer < ActiveModel::Serializer
  attributes :id, :rating, :difficulty, :comment, :created_at

  belongs_to :beer
end