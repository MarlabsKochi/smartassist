class Api::V1::BeaconsController < Api::V1::BaseController
  def beacon_details
    beacon_details = Beacon.find_by_uuid(params["uuid"])
      if beacon_details 
        @data = User.find(current_user.id) if Appointment.create(:user_status_id=>beacon_details.status_name,:user_id=>current_user.id)
        WebsocketRails[:reception].trigger 'new', @data
        response = {
          response_code: "1",
          uuid: beacon_details.uuid,
      	  context: beacon_details.service_point_name,
      	  message: beacon_details.message
        }
        render_json(response)
      else
      	error! :not_found,:metadata => {:response_code => "0"}
      end
   end
end