class FloorPoint < ActiveRecord::Base
	serialize :floor_coordinates
	validates :floor_coordinates, presence: true
end
