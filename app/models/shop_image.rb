class ShopImage < ApplicationRecord
  belongs_to :shop
  attachment :image
end
