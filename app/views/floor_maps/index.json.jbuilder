json.array!(@floor_maps) do |floor_map|
  json.extract! floor_map, :id, :name
  json.url floor_map_url(floor_map, format: :json)
end
