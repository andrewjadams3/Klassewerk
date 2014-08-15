class School < ActiveRecord::Base
	validates :code, :location, :mascot, :name, presence: true
end
