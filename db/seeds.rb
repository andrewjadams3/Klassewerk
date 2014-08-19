# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Teacher.destroy_all
Student.destroy_all
Worksheet.destroy_all
Response.destroy_all

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
  first_name: "Bill",
  last_name: "Teacher",
  email: "admin@classwork.com",
  password: "password",
  class_code: 'MBT-982',
  password_confirmation: "password")

student = teacher.students.create(
  first_name: "Johnny",
  last_name: "Student",
  username: 'student',
  password: 'password',
  password_confirmation: "password")

worksheet_1 = teacher.worksheets.create(
  name: "Math Worksheet",
  url: "http://www.math-aids.com/images/skip-counting-worksheets.png",
  input_fields: [{x: "50px", y: "50px", height: "50px", width: "50px"}]
)

response = Response.create(
  student_id: student.id,
  worksheet_id: worksheet_1.id,
  answers: [{content: "A flibberty-gibbet"},
            {content: "How appropriate, you fight like a cow."}],
  submitted: true,
  grading: [{correct: false},
            {correct: true}],
  notes: "Needs work. 1/2 You FAIL."
)

worksheet_2 = teacher.worksheets.create(
  name: "English Worksheet",
  url: "http://www.studyvillage.com/attachments/Resources/3118-192245-Singular-plural-worksheet.png",
  input_fields: [{x: "50px", y: "50px", height: "50px", width: "50px"}]
)

teacher.students << student
teacher.worksheets << worksheet_1
teacher.worksheets << worksheet_2
