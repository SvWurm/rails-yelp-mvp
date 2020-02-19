require 'faker'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])

puts "Cleaning database"
Restaurant.destroy_all
Review.destroy_all
puts "create 10 restaurants"
10.times do
  @restaurant = Restaurant.create(
    name: Faker::Restaurant.name,
    address: Faker::Address.full_address,
    phone_number: Faker::PhoneNumber.phone_number,
    category: Restaurant::CATEGORIES.sample)
  # write 1 to 8 reviews for each restaurant
  rand(9).times do
    @review = Review.new(content: Faker::Restaurant.review, rating: rand(6))
    @review.restaurant = @restaurant
    @review.save
  end
end
puts "Created 10 restaurants with a total of #{Review.count} reviews"
