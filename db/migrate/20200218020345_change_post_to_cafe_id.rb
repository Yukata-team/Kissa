class ChangePostToCafeId < ActiveRecord::Migration[5.2]
  def change
    rename_column :posts, :cafe_id, :shop_id
  end
end
