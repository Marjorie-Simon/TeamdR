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

puts "Destroying all Users"
User.destroy_all
puts "Destroying all daily statuses"
DailyStatus.destroy_all
# creating all users from google spreadheet
puts "Creating users..."


user_url = "https://spreadsheets.google.com/feeds/list/1CW_PI1spEoZ-e87TD9TvwVBz1-n2etWw5wGufLOC9I0/1/public/values?alt=json"
user_seed_url = open(user_url).read
user_seed_json = JSON.parse(user_seed_url)

user_seed_json['feed']['entry'].each_with_index do |seed, index|
  user = User.new(
    first_name:  seed['gsx$firstname']['$t'],
    last_name: seed['gsx$lastname']['$t'],
    email: seed['gsx$email']['$t'],
    password: seed['gsx$password']['$t'],
    # password_confirmation: seed['gsx$password']['$t'],
    manager: seed['gsx$manager']['$t'],
   )
  file = URI.open(seed['gsx$photo']['$t'])

  user.photo.attach(io: file, filename: user.first_name, content_type: 'image/png')
  user.save!
  puts "user#{index} created"
end

puts "Successfully created users. Easy!"

puts "creating Daily Statuses"
daily_status_url = "https://spreadsheets.google.com/feeds/list/1s_Htg5phe-1fTjDsfsxWpPlyYcAjgOMmGzy2UQ1Ilrs/1/public/full?alt=json"
daily_status_seed_url = open(daily_status_url).read
daily_status_seed_json = JSON.parse(daily_status_seed_url)

daily_status_seed_json['feed']['entry'].each_with_index do |seed, index|
  daily_status= DailyStatus.new(
    title: seed['gsx$title']['$t'],
    date: seed['gsx$date']['$t'],
    user: User.find_by(email: seed['gsx$useremail']['$t']),
    daily_goal: seed['gsx$dailygoal']['$t']
    )
  daily_status.save!
  puts "daily status #{index} created"

  puts "Creating ratings..."
  rating = Rating.new(
    value_stars: rand(1..5),
    daily_status_id: daily_status.id
  )
  rating.save!
end
20.times do
  rating = Rating.new(
    value_stars: rand(3..5),
    daily_status: DailyStatus.all.sample
  )
  rating.save!
end

puts "Ratings created!!"
puts "Successfully created daily statuses. Nailed it YEAH!"







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
