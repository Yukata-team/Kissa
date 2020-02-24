class AddBranchToShops < ActiveRecord::Migration[5.2]
  def change
    add_column :shops, :branch, :string
    add_column :shops, :furigana, :string
  end
end
