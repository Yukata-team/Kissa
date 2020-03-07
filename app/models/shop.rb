class Shop < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_many :shop_images, dependent: :destroy
  belongs_to :user
  accepts_attachments_for :shop_images, attachment: :image
  validates :name, presence: true, length: {maximum: 30}
  validates :station_name, length: {maximum: 20}
  validates :branch, length: {maximum: 30}
  validates :furigana, presence: true, length: {maximum: 30}
  attachment :image
  attachment :head_image

  def posts
    return Post.where(shop_id: self.id)
  end

  def post
    return Post.find_by(shop_id: self.id)
  end

  def user
    return User.find(self.user_id)
  end

end
