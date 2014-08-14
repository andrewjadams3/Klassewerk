class Teacher < ActiveRecord::Base
  belongs_to :school
  has_many :classrooms
  has_many :assignments, through: :classrooms
end
