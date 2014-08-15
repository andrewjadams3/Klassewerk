class Student < ActiveRecord::Base
  has_many :enrollments
  has_many :classrooms, through: :enrollments
  has_many :responses
  belongs_to :school

  validates :first_name, :last_name, :username, :security_question, :security_answer,:password_digest,  presence: true

  has_secure_password
  
end
