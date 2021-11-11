class Rating < ApplicationRecord
  belongs_to :user
  belongs_to :book

  validates :user, uniqueness: {scope: :book, message: "User have already rated for this book"}
end
