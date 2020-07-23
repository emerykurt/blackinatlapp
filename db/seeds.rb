# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'csv'

CSV.foreach('csv/Eateries.csv') do |row|
  name = row[1]
  owner = row[2]
  type_of_food = row[3]
  neighborhood = row[4]
  address = row[5]
  website = row[6]
  instagram = row[7]
  Eatery.create(name: name, owner: owner, type_of_food: type_of_food, neighborhood: neighborhood, address: address, website: website, instagram: instagram) 
end