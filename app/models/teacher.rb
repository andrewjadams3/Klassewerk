class Teacher < ActiveRecord::Base
  has_many :students
  has_many :worksheets
  has_many :responses, through: :students

  validates :first_name, :last_name, :password_digest, presence: true
  validates :email, presence: true, uniqueness: true

  has_secure_password

end



