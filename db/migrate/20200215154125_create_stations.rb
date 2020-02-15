class CreateStations < ActiveRecord::Migration[5.2]
  def change
    create_table :stations do |t|

      t.integer :station_id
      t.string :station_name
      t.string :address
      t.timestamps
    end
  end
end
