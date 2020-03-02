class ChangeTimeOfShops < ActiveRecord::Migration[5.2]
  def change
    remove_column :shops, :open_time, :time
    remove_column :shops, :close_time, :time

    add_column :shops, :business_hour, :text
  end
end
