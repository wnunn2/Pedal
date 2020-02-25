require 'open-uri'
require 'faker'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "destroying users and bicycles"
Bicycle.destroy_all
User.destroy_all
puts "destroyed users and bicycles"

20.times do
  user = User.new(
    email: Faker::Internet.email,
    password: "123456",
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name
  )
  user.save!

  rand(1..3).times do
    bicycle = Bicycle.new(
      category: Bicycle::CATEGORIES.sample,
      day_price: rand(800..2000),
      address: Faker::Address.street_address,
      description: Faker::Color.color_name,
      user: user
    )
    bicycle.save!
  end
end

user = User.new(
  email: "richlynch2@gmail.com",
  password: "123456",
  first_name: "rich",
  last_name: "lynch"
)
user.save!

bicycle = Bicycle.new(
  category: Bicycle::CATEGORIES.sample,
  day_price: 500,
  address: "1234 Meguro-town",
  description: "sick ass bike, rent this",
  user: user
)
bicycle.save!

puts "created bicycles and users"
