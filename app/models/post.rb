class Post < ApplicationRecord
  belongs_to :shop
  belongs_to :user

  def shop
    return Shop.find(self.shop_id)
  end
end
