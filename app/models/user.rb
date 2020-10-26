class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :reviews, dependent: :destroy

  def interests
    item_ids = Review.where(user_id: self.id, is_interested: true).pluck(:item_id)
    Item.where(id: item_ids)
  end

end
