
class Api::V1::ChecksController < Api::V1::BaseController


  def initialize_floor_map
  hash={}
  hash["points"] = [

 {:id =>"FLR1-BC1",:name =>"Gift House/Entrance",:x => 6,:y=>17,:beaconx=>5,:beacony=>19,:beacon_major=>1001,:floor_level=> "1",:near_node_details=>
 [{:direction=>"NORTH EAST",:distance=>1.8,:near_point=>"FLR1-C2"},{:direction=>"SOUTH WEST",:distance=>3,:near_point=>"FLR1-C3"},{:direction=>"SOUTH EAST",:distance=>3,:near_point=>"FLR1-C9"}]},


 {:id =>"FLR1-C3",:name =>"First turn",:x => 43,:y=>374,:beaconx=>1,:beacony=>1,:beacon_major=>13708,:floor_level=> "1",
  :near_node_details=>[{:direction=>"NORTH EAST",:distance=>3,:near_point=>"FLR1-BC1"},{:direction=>"NORTH WEST",:distance=>3,:near_point=>"FLR1-C4"}]},


 {:id =>"FLR1-C4",:name =>"Rest Room",:x => 2,:y=>12,:beaconx=>1,:beacony=>1,:beacon_major=>1001,:floor_level=> "1",
  :near_node_details=>[{:direction=>"NORTH WEST",:distance=>3.8,:near_point=>"FLR1-BC5"},{:direction=>"SOUTH EAST",:distance=>3,:near_point=>"FLR1-C3"}]},

 {:id =>"FLR1-BC5",:name =>"East Tower and Starbucks (level1)",:x => 43,:y=>136,:beaconx=>2,:beacony=>6,:beacon_major=>7088,:floor_level=> "1",
  :near_node_details=>[{:direction=>"NORTH EAST",:distance=>4.8,:near_point=>"FLR1-C6"},{:direction=>"SOUTH EAST",:distance=>3.8,:near_point=>"FLR1-C4"}]},

 {:id =>"FLR1-C2",:name =>"Admitting / Patients Check-in",:x => 216,:y=>374,:beaconx=>1,:beacony=>1,:beacon_major=>1001,:floor_level=> "1",
  :near_node_details=>[{:direction=>"NORTH EAST",:distance=>6.2,:near_point=>"FLR1-BC8"},{:direction=>"SOUTH WEST",:distance=>1.8,:near_point=>"FLR1-BC1"},{:direction=>"NORTH WEST",:distance=>6.8,:near_point=>"FLR1-C6"}]},

 {:id =>"FLR1-BC8",:name =>"Emergency Department",:x => 433,:y=>374,:beaconx=>20,:beacony=>18,:beacon_major=>23092,:floor_level=> "1",
  :near_node_details=>[{:direction=>"SOUTH WEST",:distance=>6.2,:near_point=>"FLR1-C2"}]},

{:id =>"FLR1-C6",:name =>"Our Lady of Mercy Chapel",:x => 216,:y=>136,:beaconx=>19,:beacony=>6,:beacon_major=>1001,:floor_level=> "1",
  :near_node_details=>[{:direction=>"SOUTH WEST",:distance=>4.8,:near_point=>"FLR1-BC5"},{:direction=>"SOUTH EAST",:distance=>6.8,:near_point=>"FLR1-C2"},
    {:direction=>"NORTH EAST",:distance=>6.2,:near_point=>"FLR1-BC7"}]},

 {:id =>"FLR1-BC7",:name =>"Exit point",:x => 433,:y=>136,:beaconx=>19,:beacony=>6,:beacon_major=>8778,:floor_level=> "1",
  :near_node_details=>[{:direction=>"SOUTH WEST",:distance=>6.2,:near_point=>"FLR1-C6"}]},
]
hash["floor_map_url"] =  "http://192.168.63.68:8000#{FloorMap.find(8).name.url}"
      render_json(hash) 
  end


  def get_shortest_path
    paths_stored = [["FLR1-BC8", "FLR1-C2", 6.2],["FLR1-C2", "FLR1-BC8", 6.2],["FLR1-C2","FLR1-BC1",1.8],["FLR1-BC1","FLR1-C2",1.8],["FLR1-BC1","FLR1-C3",3],["FLR1-C3","FLR1-BC1",3],
                    ["FLR1-C3", "FLR1-C4", 3],["FLR1-C4", "FLR1-C3", 3],["FLR1-C4", "FLR1-BC5", 3.8],["FLR1-BC5", "FLR1-C4", 3.8],
                    ["FLR1-BC5", "FLR1-C6", 4.8],["FLR1-C6", "FLR1-BC5", 4.8],["FLR1-C6", "FLR1-BC7", 6.2],["FLR1-BC7", "FLR1-C6", 6.2],
                    ["FLR1-C6", "FLR1-C2", 6.8],["FLR1-C2", "FLR1-C6", 6.8],["FLR1-BC1", "FLR1-C9", 3],["FLR1-C9", "FLR1-BC1", 3],["FLR1-C9", "FLR1-BC10", 5],["FLR1-BC10", "FLR1-C9", 5]               
      	           ] 
    paths_stored_for_floor0 = [["FLR0-BC1", "FLR0-C2", 3],["FLR0-C2", "FLR0-BC1", 3],["FLR0-BC3", "FLR0-C2", 5],["FLR0-C2", "FLR0-BC3", 5],
                              ["FLR0-BC3", "FLR0-C4", 10],["FLR0-C4", "FLR0-BC3", 10]]
    if params[:floor_no].to_i == 1
      p "im in first"
      start_point = params[:start_point]
      end_point = params[:end_point]
      if start_point && end_point
        result = Dijkstra.new(start_point,end_point, paths_stored)
        response = {:path => result.shortest_path} if result
        render_json(response) if response
      end
    end
    if params[:floor_no].to_i==0
      p "im in second"
      start_point = params[:start_point]
      end_point = params[:end_point]
      if start_point && end_point
        result = Dijkstra.new(start_point,end_point, paths_stored_for_floor0)
        response = {:path => result.shortest_path} if result
        render_json(response) if response
      end
    end  
  end
end
