# An Item is any piece of media that users can find mutual interest in
# For the purpose of this Proof of Concept, Items are limited to NPR podcast episodes
# Future rollouts may open Items category to include movies, TV shows, audiobooks, perhaps restaurants

class Item < ApplicationRecord
  has_many :reviews, dependent: :destroy
  validates_presence_of :title, :description, :category
  validates :title, uniqueness: true
  
  def review_by_user(user)
    Review.find_by(item_id: self.id, user_id: user.id)
  end

  def is_user_interested?(user)
    item_review = review_by_user(user)
    item_review.present? ? item_review.is_interested : false
  end

end