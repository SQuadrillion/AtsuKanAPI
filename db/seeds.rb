# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

[{id: 1, name: 'waseda'}, {id: 2, name: 'Colopl'}].each do |data|
  place = Place.new
  place.id = data["id"]
  place.name = data["name"]
  place.qrcode = "http://chart.apis.google.com/chart?chs=150x150&cht=qr&chl=#{place.id},#{place.name}"
  place.save
  Status.create(hot: 0, cold: 0)
end

# place = Place.new
# place.id = 1
# place.name = 'Waseda University'
# place.qrcode = "http://chart.apis.google.com/chart?chs=150x150&cht=qr&chl=#{place.id},#{place.name}"
# place.save

# Status.create(hot: 0, cold: 0)