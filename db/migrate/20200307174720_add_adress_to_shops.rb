class AddAdressToShops < ActiveRecord::Migration[5.2]
  def change
    add_column :shops, :postal_code, :string
    add_column :shops, :prefecture, :string
    add_column :shops, :city, :string
    add_column :shops, :street, :string
  end
end
