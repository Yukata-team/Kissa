class AddOtherNameToShops < ActiveRecord::Migration[5.2]
  def change
    add_column :shops, :other_name, :string
  end
end
