class AddColumnToPost < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :review, :text
  end
end
