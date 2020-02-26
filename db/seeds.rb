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

 descriptions_hash = {
  "Road Bike": "Road bikes can be identified by their skinny tires and down-turned or “drop” handlebars. These bikes rule the road due to their extreme efficiency and speed. The larger thin tires help it glide along the road with little effort, while the multi-position handlebar offers grip variations from upright to more aggressive.",
  "Mountain Bike": "Mountain bikes have wide knobby tires which allow them to be ridden in loose dirt and over obstacles. These bikes have flat handlebars and rugged frames and components. Mountain bikes often have suspension to help any cyclist navigate rocky mountain trails. Many people ride mountain bikes on roads as well as trails.",
  "Electric Bike": "Electric Bikes consist of a modified or custom bicycle frame with pedals but include an electric motor, usually in the form of a hub motor, mid-drive motor or belt drive connected to the rear wheel. They are both comfortable, and energy efficient",
  "Tandem Bike": "A tandem is a bicycle built for two. They come in many styles and are the great leveler of the cycling world. Two riders of different abilities can enjoy a ride at the same pace when riding a tandem. They work well with younger riders, new cyclists, or the blind.",
  "Fixed-Gear Bike": "They have a single, fixed gear but may have brakes and different styles of handlebars. These bikes are often used for racers in training because they force the athlete to spin their legs in a consistent circle and run a higher cadence. They are also used in cities or as foul weather bikes.",
  "Folding Bike": "A folding bike can be a great travel companion.  Because they fold, they fit easily on a subway, in the trunk of a car, or on a boat. When traveling by air one can avoid the additional charges and hassle associated with transporting a full-sized bicycle. Perfect for a little Japanese salary man!"
}


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
    bike_type = Bicycle::CATEGORIES.sample
    bike_type_symbol = bike_type.to_sym
    bicycle = Bicycle.new(
      category: bike_type,
      day_price: rand(800..1200),
      address: Faker::Address.street_address,
      description: descriptions_hash[bike_type_symbol],
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

puts "created bicycles and users"
