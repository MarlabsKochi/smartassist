class FloorMap < ActiveRecord::Base
	mount_uploader :name, PictureUploader
	validates :length, presence: true
	validates :width, presence: true
end
