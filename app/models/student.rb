class Student < ActiveRecord::Base
  has_many :enrollments
  has_many :classrooms, through: :enrollments
  has_many :responses
  belongs_to :school
end
