# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'faker'

User.destroy_all
Spaceship.destroy_all

puts 'Creating 3 fake users...'
3.times do
  user = User.new(
    name: Faker::Name.name.to_s,
    email: Faker::Internet.email.to_s,
    password: Faker::Internet.password.to_s
  )
  user.save!
end
puts "The final frontier..."

puts 'Creating 8 fake spaceships...'

8.times do
  spaceship = Spaceship.new(
    name: Faker::Space.nasa_space_craft.to_s,
    price: rand(150..100_000),
    capacity: rand(1..50),
    user_id: rand(1..3)
  )
  spaceship.save!
end

puts "Blast off!" 

puts "#{Spaceship.count} spaceships were created. #{User.count} users were created."
