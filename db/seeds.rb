# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

Restaurant.destroy_all

puts 'Creating fake restaurants'

5.times do
  restaurant = Restaurant.new(
    name: Faker::Restaurant.name,
    address: Faker::Address.city,
    phone_number: Faker::PhoneNumber.phone_number,
    category: Restaurant.categories.sample
  )
  restaurant.save

  5.times do
    review = Review.new(
      content: Faker::ChuckNorris.fact,
      rating: rand(0..5),
      restaurant: restaurant
    )
    review.save!
  end
end
