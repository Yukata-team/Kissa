class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.integer :cafe_id
      t.integer :user_id
      t.float :post_total_point
      t.float :congestion
      t.float :menu
      t.float :price
      t.float :wifi
      t.float :others

      t.timestamps
    end
  end
end
