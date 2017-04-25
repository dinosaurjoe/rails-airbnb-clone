# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
password = Faker::Internet.password(8)

20.times do
  User.create(
    email: Faker::Internet.email,
    password: password,
    password_confirmation: password,
    first_name: Faker::Name.first_name,
    last_name: Faker::Food.ingredient
    )
end

boat_type = ["Fishing Boat", "Sail Boat", "Canoe", "Speed Boat", "Yacht", "Houseboat", "Banana Boat", "Kayak", "Life Boat", "Pirate Ship", "Shrimp Boat", "Tug Boat"]
20.times do
  Boat.create(
    category: boat_type.sample,
    city: Faker::Address.city,
    address: Faker::Address.street_address,
    price: (1..20000).to_a.sample.to_i,
    capacity: (1..200).to_a.sample.to_i,
    name: Faker::Name.name,
    )
end

