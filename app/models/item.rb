class Item < ApplicationRecord

  validates_presence_of :title, :description, :category, :media_url

end