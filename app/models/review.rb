class Review < ApplicationRecord
  belongs_to :user
  belongs_to :item

  validates_inclusion_of :is_interested, :in => [true, false]
end
