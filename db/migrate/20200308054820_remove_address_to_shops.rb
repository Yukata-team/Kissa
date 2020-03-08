class RemoveAddressToShops < ActiveRecord::Migration[5.2]
  def change
    remove_column :shops, :postal_code
    remove_column :shops, :prefecture
    remove_column :shops, :city
    remove_column :shops, :street
    remove_column :shops, :building

    add_column :shops, :postcode, :integer
    add_column :shops, :prefecture_code, :integer
    add_column :shops, :address_city, :string
    add_column :shops, :address_street, :string
    add_column :shops, :address_building, :string
  end
end
