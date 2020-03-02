class ChangeTimeToShops < ActiveRecord::Migration[5.2]
  def change
    change_column :shops, :open_time, :time
    change_column :shops, :close_time, :time
  end
end
