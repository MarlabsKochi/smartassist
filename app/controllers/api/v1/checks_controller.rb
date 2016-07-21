
class Api::V1::ChecksController < Api::V1::BaseController


  def initialize_floor_map
 hash={}
  hash["points"] = [



 {:id =>"FLR1-BC3",:name =>"First turn",:x => 43,:y=>374,:beaconx=>18,:beacony=>394,:beacon_major=>13708,:floor_level=> "1",
  :near_node_details=>[{:direction=>"NORTH EAST",:distance=>4.8,:near_point=>"FLR1-C2"},{:direction=>"NORTH WEST",:distance=>6.8,:near_point=>"FLR1-BC5"}]},


 

 {:id =>"FLR1-BC5",:name =>"East Tower and Starbucks (level1)",:x => 43,:y=>136,:beaconx=>43,:beacony=>100,:beacon_major=>7088,:floor_level=> "1",
  :near_node_details=>[{:direction=>"NORTH EAST",:distance=>4.8,:near_point=>"FLR1-C6"},{:direction=>"SOUTH EAST",:distance=>6.8,:near_point=>"FLR1-BC3"}]},

 {:id =>"FLR1-C2",:name =>"Admitting / Patients Check-in",:x => 216,:y=>374,:beaconx=>18,:beacony=>394,:beacon_major=>1001,:floor_level=> "1",
  :near_node_details=>[{:direction=>"NORTH EAST",:distance=>6.2,:near_point=>"FLR1-BC8"},{:direction=>"SOUTH WEST",:distance=>4.8,:near_point=>"FLR1-BC3"},{:direction=>"NORTH WEST",:distance=>6.8,:near_point=>"FLR1-C6"}]},

 {:id =>"FLR1-BC8",:name =>"Emergency Department",:x => 433,:y=>374,:beaconx=>408,:beacony=>404,:beacon_major=>23092,:floor_level=> "1",
  :near_node_details=>[{:direction=>"SOUTH WEST",:distance=>6.2,:near_point=>"FLR1-C2"}]},

{:id =>"FLR1-C6",:name =>"Our Lady of Mercy Chapel",:x => 216,:y=>136,:beaconx=>19,:beacony=>6,:beacon_major=>1001,:floor_level=> "1",
  :near_node_details=>[{:direction=>"SOUTH WEST",:distance=>4.8,:near_point=>"FLR1-BC5"},{:direction=>"SOUTH EAST",:distance=>6.8,:near_point=>"FLR1-C2"},
    {:direction=>"NORTH EAST",:distance=>6.2,:near_point=>"FLR1-BC7"}]},

 {:id =>"FLR1-BC7",:name =>"Exit point",:x => 433,:y=>136,:beaconx=>415,:beacony=>97,:beacon_major=>8778,:floor_level=> "1",
  :near_node_details=>[{:direction=>"SOUTH WEST",:distance=>6.2,:near_point=>"FLR1-C6"}]},
]
hash["floor_map_url"] =  ""
      render_json(hash) 
  end

  def initialize_floor_map_android
    hash={}
    hash["points"] = [{
      :id =>"FLR1-BC5",:name =>"East Tower and Starbucks (level1)",:x => 43,:y=>136,:beaconx=>43,
      :beacony=>100,:beacon_major=>7088,:floor_level=> "1",
      :near_node_details=>[{:direction=>"NORTH EAST",:distance=>4.8,:near_point=>"FLR1-BC6"}]},
      {:id =>"FLR1-BC2",:name =>"Admitting / Patients Check-in",:x => 216,:y=>374,:beaconx=>212,
      :beacony=>402,:beacon_major=>13708,:floor_level=> "1",
      :near_node_details=>[{:direction=>"NORTH WEST",:distance=>6.8,:near_point=>"FLR1-BC6"}]},

      {:id =>"FLR1-BC6",:name =>"Our Lady of Mercy Chapel",:x => 216,:y=>136,:beaconx=>180,:beacony=>91,:beacon_major=>23092,:floor_level=> "1",
      :near_node_details=>[{:direction=>"SOUTH WEST",:distance=>4.8,:near_point=>"FLR1-BC5"},{:direction=>"SOUTH EAST",:distance=>6.8,:near_point=>"FLR1-BC2"},
      {:direction=>"NORTH EAST",:distance=>6.2,:near_point=>"FLR1-BC7"}]},
      {:id =>"FLR1-BC7",:name =>"Exit point",:x => 433,:y=>136,:beaconx=>415,:beacony=>97,:beacon_major=>6034,:floor_level=> "1",
      :near_node_details=>[{:direction=>"SOUTH WEST",:distance=>6.2,:near_point=>"FLR1-BC6"}]}]
    hash["floor_map_url"] =  ""
    render_json(hash) 
  end


  def get_shortest_path
    paths_stored = [["FLR1-BC8", "FLR1-C2", 6.2],["FLR1-C2", "FLR1-BC8", 6.2],["FLR1-C2","FLR1-BC3",4.8],["FLR1-BC3","FLR1-C2",4.8],
                    ["FLR1-C3", "FLR1-BC5", 6.8],["FLR1-BC5", "FLR1-C3", 6.8],
                    ["FLR1-BC5", "FLR1-C6", 4.8],["FLR1-C6", "FLR1-BC5", 4.8],["FLR1-C6", "FLR1-BC7", 6.2],["FLR1-BC7", "FLR1-C6", 6.2],
                    ["FLR1-C6", "FLR1-C2", 6.8],["FLR1-C2", "FLR1-C6", 6.8]            
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
        p response 
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
