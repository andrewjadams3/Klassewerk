class Teacher < ActiveRecord::Base
  belongs_to :school
  has_many :classrooms
  has_many :assignments, through: :classrooms

  validates :first_name, :last_name, :email, :password_digest, presence: true

  has_secure_password
  
end



