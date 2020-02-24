class CreateShopImages < ActiveRecord::Migration[5.2]
  def change
    create_table :shop_images do |t|
      t.string :shop_id
      t.string :integer
      t.string :image_id
      t.string :string

      t.timestamps
    end
  end
end
