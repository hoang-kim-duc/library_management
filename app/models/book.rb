class Book < ApplicationRecord
  has_one_attached :data
  has_one_attached :cover

  belongs_to :category
end
