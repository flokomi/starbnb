# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'faker'

Spaceship.destroy_all
User.destroy_all

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

all_users = User.all
all_users.each do |user|
  4.times do
  Spaceship.create!(
    name: Faker::Name.first_name.to_s,
    price: rand(100..1000),
    capacity: rand(1..5),
    description: "Lorem ipsum dolor sit amet consectetur adipisicing elit. Voluptatibus, placeat. Suscipit facilis dicta ullam, quos praesentium qui accusantium! Fuga odio delectus harum magnam, magni iure ipsam nemo atque iusto corporis? Lorem ipsum dolor sit amet consectetur adipisicing elit. Non officia eos cupiditate iusto aliquid minima accusamus, nemo repudiandae est, voluptates blanditiis voluptatum quaerat delectus eum dolorum! Voluptas praesentium autem eos?",
    user: user
  )
 end
end

puts "Blast off!"

puts "#{Spaceship.count} spaceships were created. #{User.count} users were created."
