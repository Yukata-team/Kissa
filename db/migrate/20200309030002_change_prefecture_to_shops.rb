class ChangePrefectureToShops < ActiveRecord::Migration[5.2]
  def change
    change_column :shops, :prefecture_code, :string
  end
end
