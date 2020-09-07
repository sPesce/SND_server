# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'csv'

location = Location.first
if(!location)
  CSV.foreach(Rails.root.join('lib/locations_seeds.csv'), headers: true) do |row|
    Location.create( {
      zip: row["ZIP"], 
      lat: row["LAT"],
      long: row["LNG"]
    } ) 
  end
end
# first: "jeff",
# last: "jeffreys",
# email: "jeff@jeffsmail.com",
# password:,
# bio: "hi im jeff",
# zip_code: "19121",
# validated: false,
# account_type: "standard",
# , gender: nil>