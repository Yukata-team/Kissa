class CreateCaves < ActiveRecord::Migration[5.2]
  def change
    create_table :caves do |t|
      t.string :name
      t.integer :total_point
      t.string :station_name

      t.timestamps
    end
  end
end
