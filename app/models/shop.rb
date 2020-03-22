class Shop < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_many :shop_images, dependent: :destroy
  belongs_to :user
  accepts_attachments_for :shop_images, attachment: :image
  validates :name, presence: true, length: {maximum: 30}
  validates :station_name, length: {maximum: 20}
  validates :branch, length: {maximum: 30}
  validates :furigana, presence: true, length: {maximum: 30}, uniqueness: true
  validates :postcode, presence: true
  validates :prefecture_code, presence: true
  validates :address_city, presence: true
  validates :address_street, presence: true
  attachment :image
  attachment :head_image
  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  def posts
    return Post.where(shop_id: self.id)
  end

  def post
    return Post.find_by(shop_id: self.id)
  end

  def user
    return User.find(self.user_id)
  end

  include JpPrefecture
  jp_prefecture :prefecture_code

  def prefecture_name
    JpPrefecture::Prefecture.find(code: prefecture_code).try(:name)
  end

  def prefecture_name=(prefecture_name)
    self.prefecture_code = JpPrefecture::Prefecture.find(name: prefecture_name).code
  end

  class << self
      def within_box(distance, latitude, longitude)
          distance = distance
          center_point = [latitude, longitude]
          box = Geocoder::Calculations.bounding_box(center_point, distance)
          self.within_bounding_box(box)
      end
  end

  private
  def geocode
    uri = URI.escape("https://maps.googleapis.com/maps/api/geocode/json?address="+self.address.gsub(" ", "")+"&key=AIzaSyD_jl5PjW9qGNH6nPpOPlU4abwO09x7hzA")
    res = HTTP.get(uri).to_s
    response = JSON.parse(res)
    self.latitude = response["results"][0]["geometry"]["location"]["lat"]
    self.longitude = response["results"][0]["geometry"]["location"]["lng"]
  end

end
