class Worksheet < ActiveRecord::Base
  has_many :responses
  belongs_to :teacher
end
