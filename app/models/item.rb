class Item < ApplicationRecord
  has_many :reviews, dependent: :destroy
  validates_presence_of :title, :description, :category
  
  def review_by_user(user)
    Review.find_by(item_id: self.id, user_id: user.id)
  end

  def is_user_interested?(user)
    item_review = review_by_user(user)
    item_review.present? ? item_review.is_interested : false
  end

end