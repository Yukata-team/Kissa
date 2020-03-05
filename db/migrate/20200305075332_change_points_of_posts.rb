class ChangePointsOfPosts < ActiveRecord::Migration[5.2]
  def change
    change_column :posts, :congestion, :float
    change_column :posts, :menu, :float
    change_column :posts, :price, :float
    change_column :posts, :wifi, :float
    change_column :posts, :others, :float
  end
end
