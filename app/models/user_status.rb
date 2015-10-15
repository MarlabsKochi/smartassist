class UserStatus < ActiveRecord::Base

  def self.entrance_status
    where(name: 'ArrivingAtEntrance').first
  end

end
