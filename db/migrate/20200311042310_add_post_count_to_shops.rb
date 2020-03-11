class AddPostCountToShops < ActiveRecord::Migration[5.2]
  def change
    add_column :shops, :post_count, :integer
  end
end
