# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# require "open-uri"
# file = URI.open("https://res.cloudinary.com/dai1inff0/image/upload/v1614696012/vxgtpr6kiznptp3mrcc0.jpg")
require 'faker'


puts "Cleaning database..."
User.destroy_all

puts "Creating users..."
ida = User.create(first_name: "Ida", last_name: "Blabla", email: "ida.blabla@zalando.com", password:"123456", manager: false)
# ida.photo.attach(io:file, filename: 'ida.png', content_type:'image/png')
angela = User.create(first_name: "Angela", last_name: "Meek", email: "angela.meek@zalando.com", password:"123456", manager: true)

50.times do |user|
  user = User.create(first_name:Faker::Name.first_name, last_name:Faker::Name.last_name, email: Faker::Internet.email, password:Faker::Number.number(digits: 6), manager: false)
end

puts "Finished!"

ida = User.new(first_name: "Ida", last_name: "Blabla", email: "ida.blablatadta@gmail.com", password:"123456", manager: false)
# ida.photo.attach(io:file, filename: 'ida.png', content_type:'image/png')
ida.save!
