# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Teacher.destroy_all
Student.destroy_all

20.times do
  password = Faker::Internet.password
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  username = (first_name + last_name).downcase
  Teacher.create(
    first_name: first_name,
    last_name: last_name,
    username: username,
    email: Faker::Internet.email,
    security_question: Faker::Lorem.sentence,
    security_answer: Faker::Lorem.sentence,
    password: password,
    password_confirmation: password
    )
end

20.times do
  password = Faker::Internet.password
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  username = (first_name + last_name).downcase
  Student.create(
    first_name: first_name,
    last_name: last_name,
    username: username,
    security_question: Faker::Lorem.sentence,
    security_answer: Faker::Lorem.sentence,
    password: password,
    password_confirmation: password
    )
end