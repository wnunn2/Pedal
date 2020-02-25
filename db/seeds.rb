# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
user = User.new(
  email: "richlynch2@gmail.com",
  password: "123456",
  first_name: "rich",
  last_name: "lynch"
)
user.save!

bicycle = Bicycle.new(
  category: "mountain bike",
  day_price: 500,
  address: "1234 Meguro-town",
  description: "sick ass bike, rent this",
  user: user
)
bicycle.save!
