class AddTimeToShops < ActiveRecord::Migration[5.2]
  def change
    add_column :shops, :open_time, :integer
    add_column :shops, :close_time, :integer
  end
end
