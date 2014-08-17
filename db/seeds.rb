# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Teacher.destroy_all
Student.destroy_all
Classroom.destroy_all

# 20.times do
#   password = Faker::Internet.password
#   Teacher.create(
#     first_name: Faker::Name.first_name,
#     last_name: Faker::Name.last_name,
#     email: Faker::Internet.email,
#     password: password,
#     password_confirmation: password
#     )
# end

# 20.times do
#   password = Faker::Internet.password
#   first_name = Faker::Name.first_name
#   last_name = Faker::Name.last_name
#   username = (first_name + last_name).downcase
#   Student.create(
#     first_name: first_name,
#     last_name: last_name,
#     username: username,
#     password: password,
#     password_confirmation: password
#     )
# end


teacher = Teacher.create(
  first_name: "bill",
  last_name: "bill",
  email: "bill@bill.com",
  password: "password",
  password_confirmation: "password")

student = teacher.students.create(
  first_name: "student",
  last_name: "student",
  username: 'student',
  password: 'password',
  password_confirmation: "password")

worksheet = teacher.worksheets.create(
  name: "Math Worksheet",
  url: "http://www.math-aids.com/images/skip-counting-worksheets.png",
  input_fields: [{x: 50, y:50, height: 50, width: 50}].to_json
  )

worksheet = teacher.worksheets.create(
  name: "English Worksheet",
  url: "http://www.math-aids.com/images/skip-counting-worksheets.png",
  input_fields: [{x: 50, y:50, height: 50, width: 50}].to_json
  )
