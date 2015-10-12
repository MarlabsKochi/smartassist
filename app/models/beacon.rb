class Beacon < ActiveRecord::Base
  validates :uuid, :major_number, :minor_number, :service_point_name, presence: true
end
