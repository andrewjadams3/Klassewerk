class Teacher < ActiveRecord::Base
  has_many :classrooms
  has_many :students, through: :classrooms
  has_many :worksheets

  validates :first_name, :last_name, :email, :password_digest, presence: true

  has_secure_password

end



