class Shop < ApplicationRecord
  has_many :posts, dependent: :destroy

  def posts
    return Post.where(shop_id: self.id)
  end
  def user
    return User.find(self.id)
  end
end
