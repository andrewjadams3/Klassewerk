class Response < ActiveRecord::Base
  validates :student, :worksheet, :answers, :submitted, presence: true

  belongs_to :student
  belongs_to :worksheet
end
