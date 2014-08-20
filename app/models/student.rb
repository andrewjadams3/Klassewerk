class Student < ActiveRecord::Base
  belongs_to :teacher
  has_many :responses
  validates :first_name, :last_name, :username, presence: true
  validates_presence_of :teacher, :message => "/ Class code is incorrect."
  validates :username, presence: true, uniqueness: true

  before_validation :downcase_fields
  has_secure_password

  def downcase_fields
    self.username = self.username.downcase
  end
end
