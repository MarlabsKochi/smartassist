class Beacon < ActiveRecord::Base
  validates :uuid, :major_number, :minor_number, :service_point_name, :message, presence: true

  def status_name
    case service_point_name
      when 'Entrance'
        UserStatus.entrance_status.name
    end
  end

end
