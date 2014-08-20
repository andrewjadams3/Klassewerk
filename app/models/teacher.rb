class Teacher < ActiveRecord::Base
  has_many :students
  has_many :worksheets
  has_many :responses, through: :students

  validates :first_name, :last_name, :class_code, :password, :password_confirmation, presence: true
  validates :email, presence: true, uniqueness: true
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i

  has_secure_password

  before_validation :downcase_fields
  def downcase_fields
    self.email = self.email.downcase
  end
end



