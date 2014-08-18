class Student < ActiveRecord::Base
  belongs_to :teacher
  has_many :responses

  validates :first_name, :last_name, :password_digest, :teacher, presence: true
  validates :username, presence: true, uniqueness: true

  has_secure_password

end
