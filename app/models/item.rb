class Item < ApplicationRecord
  has_many :reviews, dependent: :destroy
  validates_presence_of :title, :description, :category, :media_url

end