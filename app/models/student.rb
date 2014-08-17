class Student < ActiveRecord::Base
  has_many :classrooms
  has_many :teachers, through: :classrooms
  has_many :responses

  validates :first_name, :last_name, :username, :password_digest, presence: true

  has_secure_password

end
