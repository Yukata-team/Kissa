# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'csv'

CSV.foreach('db/data/station20191227free.csv') do |row|
  station_id = row[STATION_CSVROW_STATION_CD],
  name = row[STATION_CSVROW_NAME],
  address = row[STATION_CSVROW_ADDRESS]

  Station.find_or_crete_by(
    :station_id => station_id,
    :name => name,
    :address => address
  )
end
