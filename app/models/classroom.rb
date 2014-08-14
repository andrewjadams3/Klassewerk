class Classroom < ActiveRecord::Base
  has_many :assignments
  has_many :worksheets, through: :assignments
  has_many :enrollments
  has_many :students, through: :enrollments
  belongs_to :teacher
  belongs_to :grading_period
end
