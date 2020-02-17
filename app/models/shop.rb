class Shop < ApplicationRecord
  has_many :posts, dependent: :destroy
end
