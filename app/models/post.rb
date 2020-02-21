class Post < ApplicationRecord
  belongs_to :shop
  belongs_to :user
  validates :shop_id, presence: true
  validates :user_id, presence: true
  validates :user_id, uniqueness: { scope: :shop_id} 
  validates :congestion, presence: true
  validates :menu, presence: true
  validates :price, presence: true
  validates :wifi, presence: true
  validates :others, presence: true
  validates :review, length: {maximum: 200}

  def shop
    return Shop.find(self.shop_id)
  end
end
