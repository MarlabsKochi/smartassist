json.array!(@beacons) do |beacon|
  json.extract! beacon, :id, :uuid, :major_number, :minor_number, :service_point_name, :major_number
  json.url beacon_url(beacon, format: :json)
end
