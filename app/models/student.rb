class Student < ActiveRecord::Base
  belongs_to :teacher
  has_many :responses

  validates :first_name, :last_name, :username, :password_digest, :teacher, presence: true

  has_secure_password

end
