class Bookmark < ApplicationRecord
  belongs_to :review
  belongs_to :user

  # one review per user
  validates :review, uniqueness: { scope: :user }
end
