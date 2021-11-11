class Book < ApplicationRecord
  has_one_attached :data
  has_one_attached :cover
  has_many :ratings

  belongs_to :category

  def avg_rating
    (ratings.pluck(:score).sum.to_f / ratings.size).round 1
  end
end
