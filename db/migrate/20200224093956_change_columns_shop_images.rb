class ChangeColumnsShopImages < ActiveRecord::Migration[5.2]
  def change
    remove_column :shop_images, :integer
    remove_column :shop_images, :string
    change_column :shop_images, :shop_id, :integer
  end
end
