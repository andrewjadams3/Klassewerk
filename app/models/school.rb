class School < ActiveRecord::Base
  has_many :teachers
  has_many :students
	validates :code, :location, :mascot, :name, presence: true
end
