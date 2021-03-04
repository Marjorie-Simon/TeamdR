# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# require "open-uri"
# file = URI.open("https://res.cloudinary.com/dai1inff0/image/upload/v1614696012/vxgtpr6kiznptp3mrcc0.jpg")
#require 'faker'
require 'json'
require 'open-uri'

# creating all users from google spreadheet
puts "Creating users..."


user_url = 'https://spreadsheets.google.com/feeds/cells/1CW_PI1spEoZ-e87TD9TvwVBz1-n2etWw5wGufLOC9I0/1/public/full?alt=json'
user_seed_url = open(user_url).read
user_seed_json = JSON.parse(user_seed_url)

user_seed_json['feed']['entry'].each do |seed|
  user = User.new(
    first_name:  seed['gsx$firstname']['$t'],
    last_name: seed['gsx$lastname']['$t'],
    email: seed ['gsx$email']['$t'],
    password: seed ['gsx$password']['$t'],
    manager: seed ['gsx$manager']['$t'],
    photo: "https://res.cloudinary.com/dai1inff0/image/upload/v1614858775/users/photo/#{seed['gsx$photo']['$t']}.jpg"
  )
  user.save!
end

puts "Successfully created users. Easy!"








#puts "Cleaning database..."
#User.destroy_all

#puts "Creating users..."
#ida = User.create(first_name: "Ida", last_name: "Blabla", email: "ida.blabla@zalando.com", password:"123456", manager: false)
# ida.photo.attach(io:file, filename: 'ida.png', content_type:'image/png')
#angela = User.create(first_name: "Angela", last_name: "Meek", email: "angela.meek@zalando.com", password:"123456", manager: true)

#50.times do |user|
#  user = User.create(first_name:Faker::Name.first_name, last_name:Faker::Name.last_name, email: Faker::Internet.email, password:Faker::Number.number(digits: 6), manager: false)
#end

#puts "Creating statuses..."
#title = [ "in office", "business trip", "home office", "vacation", "sick leave"]
#status_ida = DailyStatus.create(title: "in office", date: 2021-02-12, user_id: 1)

#
