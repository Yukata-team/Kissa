class CreateStations < ActiveRecord::Migration[5.2]
  def change
    create_table :stations do |t|
      t.integer :station_id, null: false, unique: true
      t.string :name
      t.string :address
    end
  end
end
