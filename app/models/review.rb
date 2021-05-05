class Review < ApplicationRecord
  belongs_to :beer
  belongs_to :user

  validates :rating, numericality: { less_than_or_equal_to: 5 }
  validates :difficulty, numericality: { less_than_or_equal_to: 10 }
  validates :comment, length: { maximum: 500 }, allow_blank: true
end