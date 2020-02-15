class DestroyStation < ActiveRecord::Migration[5.2]
  def change
    drop_table :stations
  end
end
