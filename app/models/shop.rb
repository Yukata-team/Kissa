class Shop < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_many :shop_images, dependent: :destroy
  accepts_attachments_for :shop_images, attachment: :image
  validates :name, presence: true, length: {maximum: 30}
  validates :station_name, presence: true, length: {maximum: 20}
  attachment :image

  def posts
    return Post.where(shop_id: self.id)
  end
  def post
    return Post.find_by(shop_id: self.id)
  end
end
