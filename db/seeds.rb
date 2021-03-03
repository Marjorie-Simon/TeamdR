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

<<<<<<< HEAD
require 'faker'
=======
>>>>>>> eaedee20d5e59d4f078aa703cf127a2aeb165ce2

puts "Cleaning database..."
User.destroy_all

puts "Creating users..."
ida = User.create(first_name: "Ida", last_name: "Blabla", email: "ida.blabla@zalando.com", password:"123456", manager: false)
# ida.photo.attach(io:file, filename: 'ida.png', content_type:'image/png')
angela = User.create(first_name: "Angela", last_name: "Meek", email: "angela.meek@zalando.com", password:"123456", manager: true)

50.times do |user|
  user = User.create(first_name:Faker::Name.first_name, last_name:Faker::Name.last_name, email: Faker::Internet.email, password:Faker::Number.number(digits: 6), manager: false)
end

puts "Creating statuses..."
title = [ "in office", "business trip", "home office", "vacation", "sick leave"]
status_ida = DailyStatus.create(title: "in office", date: 2021-02-12, user_id: 1)

puts "Finished!"
