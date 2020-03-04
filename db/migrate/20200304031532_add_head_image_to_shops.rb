class AddHeadImageToShops < ActiveRecord::Migration[5.2]
  def change
    add_column :shops, :head_image_id, :string
  end
end
