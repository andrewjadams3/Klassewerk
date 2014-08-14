class Assignment < ActiveRecord::Base
  belongs_to :classroom
  belongs_to :worksheet
end
