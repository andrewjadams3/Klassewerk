class Teacher < ActiveRecord::Base
  belongs_to :school
  has_many :classrooms
  has_many :assignments, through: :classrooms

  validates :first_name, :last_name, :username, :security_question, :security_answer,:password_digest, :email, presence: true

  has_secure_password
  
end



