class ChangeColumnsToPosts < ActiveRecord::Migration[5.2]
  def change
    change_column :posts, :congestion, :integer
    change_column :posts, :menu, :integer
    change_column :posts, :price, :integer
    change_column :posts, :wifi, :integer
    change_column :posts, :others, :integer
  end
end
