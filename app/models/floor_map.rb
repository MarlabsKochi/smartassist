class FloorMap < ActiveRecord::Base
	mount_uploader :name, PictureUploader
end
