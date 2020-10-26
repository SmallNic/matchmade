# Review is responsible for storing a user's interested in a particular item.

class Review < ApplicationRecord
  belongs_to :user
  belongs_to :item

  validates_inclusion_of :is_interested, :in => [true, false]
  validates_uniqueness_of :is_interested, scope: [:user_id, :item_id]

end
