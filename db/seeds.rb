require 'open-uri'
require 'faker'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
bike_images = ['https://res.cloudinary.com/dqei8yqj0/image/upload/v1582616227/Pedal/robert-bye-tG36rvCeqng-unsplash_yiq8wg.jpg', 'https://res.cloudinary.com/dqei8yqj0/image/upload/v1582616226/Pedal/claudio-schwarz-purzlbaum-UwWN33MH6IM-unsplash_wekwi3.jpg', 'https://res.cloudinary.com/dqei8yqj0/image/upload/v1582616226/Pedal/sole-bicycles-JK6lD_y3aDg-unsplash_oujexd.jpg', 'https://res.cloudinary.com/dqei8yqj0/image/upload/v1582616226/Pedal/mikkel-bech-yjAFnkLtKY0-unsplash_rqauat.jpg', 'https://res.cloudinary.com/dqei8yqj0/image/upload/v1582616226/Pedal/daniel-salcius-RRcYcdGY630-unsplash_cpuy9y.jpg', 'https://res.cloudinary.com/dqei8yqj0/image/upload/v1582616225/Pedal/patricia-tseroshova-kxuAteLDmfk-unsplash_hleiwq.jpg', 'https://res.cloudinary.com/dqei8yqj0/image/upload/v1582616225/Pedal/erik-witsoe-_WTyLE5f-3o-unsplash_uwecbs.jpg', 'https://res.cloudinary.com/dqei8yqj0/image/upload/v1582616224/Pedal/dakota-corbin-fisvoU9bf-k-unsplash_melopc.jpg', 'https://res.cloudinary.com/dqei8yqj0/image/upload/v1582616223/Pedal/jannik-wuster-HcN5H_PiZsE-unsplash_muoojo.jpg', 'https://res.cloudinary.com/dqei8yqj0/image/upload/v1582616223/Pedal/riley-harrison-9TNGeodpVEA-unsplash_dxtycj.jpg', 'https://res.cloudinary.com/dqei8yqj0/image/upload/v1582616223/Pedal/chris-barbalis-_-Rk63T6gkk-unsplash_z2udjm.jpg', 'https://res.cloudinary.com/dqei8yqj0/image/upload/v1582616222/Pedal/jump-man-lIZDXihst6c-unsplash_dejngt.jpg', 'https://res.cloudinary.com/dqei8yqj0/image/upload/v1582683361/Pedal/markus-spiske-rcGEOmdpFZU-unsplash_uug4km.jpg']


puts "destroying users and bicycles"
Bicycle.destroy_all
User.destroy_all
puts "destroyed users and bicycles"

4.times do
  user = User.new(
    email: Faker::Internet.email,
    password: "123456",
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name
  )
  user.save!

  rand(1..3).times do |index|
    bicycle = Bicycle.new(
      category: Bicycle::CATEGORIES.sample,
      day_price: rand(800..2000),
      address: Faker::Address.street_address,
      description: Faker::Color.color_name,
      user: user
    )
    file = URI.open(bike_images.sample)
    bicycle.photos.attach(io: file, filename: "bike_images#{index}.jpg", content_type: 'image/jpg')
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
bicycle.save

puts "created bicycles and users"
