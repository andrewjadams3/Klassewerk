class Worksheet < ActiveRecord::Base
  validates :name, :teacher, :url, :input_fields, presence: true
  has_many :responses
  belongs_to :teacher
end
