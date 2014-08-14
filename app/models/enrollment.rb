class Enrollment < ActiveRecord::Base
  belongs_to :student
  belongs_to :classroom
  validates :student, :classroom, presence: true
end
