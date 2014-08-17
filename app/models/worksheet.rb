class Worksheet < ActiveRecord::Base
  has_many :responses
  has_many :assignments
end
