class AddBuildingToShops < ActiveRecord::Migration[5.2]
  def change
    add_column :shops, :building, :string
  end
end
