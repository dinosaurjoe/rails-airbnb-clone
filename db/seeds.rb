# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Booking.destroy_all
Boat.destroy_all
User.destroy_all

password = Faker::Internet.password(8)

20.times do
  User.create(
    email: Faker::Internet.email,
    password: password,
    password_confirmation: password,
    first_name: Faker::Name.first_name,
    last_name: Faker::Food.ingredient,
    bio: Faker::Lorem.paragraph(2),
    profile_img: "http://placehold.it/220x220"
    )
end

boat_type = ["Fishing Boat", "Sail Boat", "Canoe", "Speed Boat", "Yacht", "Houseboat", "Banana Boat", "Kayak", "Life Boat", "Pirate Ship", "Shrimp Boat", "Tug Boat"]
city = ["Berlin, Germany", "Denver, Colorado", "San Diego, California", "São Paulo, Brazil"]
20.times do
  Boat.create(
    category: boat_type.sample,
    city: city.sample,
    address: city.sample,
    price: (1..20000).to_a.sample.to_i,
    capacity: (1..200).to_a.sample.to_i,
    name: Faker::Name.name,
    user: User.all.sample,
    photo: "https://unsplash.it/100/100/?random"
    )
end


20.times do
  Booking.create(
    user: User.all.sample,
    boat: Boat.all.sample,
    check_in: Faker::Date.backward(14).to_datetime,
    check_out: Faker::Date.forward(23).to_datetime
    )
end

