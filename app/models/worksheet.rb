class Worksheet < ActiveRecord::Base
  validates :name, :teacher, :url, presence: true
  has_many :responses
  belongs_to :teacher
end
