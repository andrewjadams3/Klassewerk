# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Teacher.destroy_all
Student.destroy_all
School.destroy_all

all_schools = []
all_students = []
all_teachers = []

10.times do 
  school = School.create(
    code: Faker::Number.number(5),
    location: Faker::Address.street_address,
    mascot: Faker::Lorem.word,
    name: Faker::Company.name
  )
  all_schools << school
end

20.times do
  password = Faker::Internet.password
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  username = (first_name + last_name).downcase
  teacher = Teacher.new(
    first_name: first_name,
    last_name: last_name,
    username: username,
    email: Faker::Internet.email,
    security_question: Faker::Lorem.sentence,
    security_answer: Faker::Lorem.sentence,
    password: password,
    password_confirmation: password
    )
  teacher.school = all_schools.sample
  teacher.save
  all_teachers << teacher
end

20.times do
  password = Faker::Internet.password
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  username = (first_name + last_name).downcase
  student = Student.create(
    first_name: first_name,
    last_name: last_name,
    username: username,
    security_question: Faker::Lorem.sentence,
    security_answer: Faker::Lorem.sentence,
    password: password,
    password_confirmation: password
  )
  student.school = all_schools.sample
  student.save
  all_students << student
end