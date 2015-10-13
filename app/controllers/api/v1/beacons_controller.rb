class Api::V1::BeaconsController < Api::V1::BaseController
	def beacon_details
      beacon_details = Beacon.find_by_uuid(params["beacon"]["uuid"])
      if beacon_details 
      	      expose({
      	      	context: beacon_details.service_point_name
      })
      else
      	error! :not_found
      end
	end
end