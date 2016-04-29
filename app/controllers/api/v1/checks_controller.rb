class Api::V1::ChecksController < Api::V1::BaseController
   

  def initialize_floor_map
  hash={}
  hash["points"] = [

 {:id =>"FLR1-BC1",:name =>"Gift House/Entrance",:x => 6,:y=>17,:beaconx=>5,:beacony=>19,:beacon_major=>56544,:near_node_details=>
 [{:direction=>"EAST",:distance=>1.8,:near_point=>"FLR1-C2"},{:direction=>"WEST",:distance=>3,:near_point=>"FLR1-C3"}]},
 {:id =>"FLR1-C3",:name =>"Gift House",:x => 2,:y=>17,:beaconx=>1,:beacony=>1,:beacon_major=>1001,:near_node_details=>[{:direction=>"EAST",:distance=>3,:near_point=>"FLR1-BC1"},{:direction=>"NORTH",:distance=>3,:near_point=>"FLR1-BC4"}]},
 {:id =>"FLR1-C4",:name =>"Rest Room",:x => 2,:y=>12,:beaconx=>1,:beacony=>1,:beacon_major=>1001,:near_node_details=>[{:direction=>"EAST",:distance=>3,:near_point=>"FLR1-BC1"},{:direction=>"NORTH",:distance=>3,:near_point=>"FLR1-BC4"}]},
 {:id =>"FLR1-BC5",:name =>"East Tower and Starbucks (level1)",:x => 2,:y=>7,:beaconx=>2,:beacony=>6,:beacon_major=>7088,:near_node_details=>[{:direction=>"EAST",:distance=>3,:near_point=>"FLR1-BC1"},{:direction=>"NORTH",:distance=>3,:near_point=>"FLR1-BC4"}]},
 {:id =>"FLR1-C2",:name =>"Admitting / Patients Check-in",:x => 9,:y=>17,:beaconx=>1,:beacony=>1,:beacon_major=>1001,:near_node_details=>[{:direction=>"EAST",:distance=>3,:near_point=>"FLR1-BC1"},{:direction=>"NORTH",:distance=>3,:near_point=>"FLR1-BC4"}]},
 {:id =>"FLR1-BC8",:name =>"Emergency Department",:x => 18,:y=>17,:beaconx=>20,:beacony=>18,:beacon_major=>23092,:near_node_details=>[{:direction=>"EAST",:distance=>3,:near_point=>"FLR1-BC1"},{:direction=>"NORTH",:distance=>3,:near_point=>"FLR1-BC4"}]},
{:id =>"FLR1-BC6",:name =>"Our Lady of Mercy Chapel",:x => 18,:y=>17,:beaconx=>20,:beacony=>18,:beacon_major=>23092,:near_node_details=>[{:direction=>"EAST",:distance=>3,:near_point=>"FLR1-BC1"},{:direction=>"NORTH",:distance=>3,:near_point=>"FLR1-BC4"}]},
{:id =>"FLR1-BC7",:name =>"Exit point",:x => 19,:y=>6,:beaconx=>19,:beacony=>6,:beacon_major=>13708,:near_node_details=>[{:direction=>"EAST",:distance=>3,:near_point=>"FLR1-BC1"},{:direction=>"NORTH",:distance=>3,:near_point=>"FLR1-BC4"}]},
{:id =>"FLR1-C9",:name =>"",:x => 6,:y=>20,:beaconx=>1,:beacony=>1,:beacon_major=>1001,:near_node_details=>[{:direction=>"EAST",:distance=>3,:near_point=>"FLR1-BC1"},{:direction=>"NORTH",:distance=>3,:near_point=>"FLR1-BC4"}]},
{:id =>"FLR1-BC10",:name =>"Elevator at Level 1",:x => 1,:y=>20,:beaconx=>1,:beacony=>20,:beacon_major=>8512,:near_node_details=>[{:direction=>"EAST",:distance=>3,:near_point=>"FLR1-BC1"},{:direction=>"NORTH",:distance=>3,:near_point=>"FLR1-BC4"}]},
]
      render_json(hash) 
  end


  def get_shortest_path
    paths_stored = [["FLR1-BC8", "FLR1-C2", 6.2],["FLR1-C2", "FLR1-BC8", 6.2],["FLR1-C2","FLR1-BC1",1.8],["FLR1-BC1","FLR1-C2",1.8],["FLR1-BC1","FLR1-C3",3],["FLR1-C3","FLR1-BC1",3],
                    ["FLR1-C3", "FLR1-C4", 3],["FLR1-C4", "FLR1-C3", 3],["FLR1-C4", "FLR1-BC5", 3.8],["FLR1-BC5", "FLR1-C4", 3.8],
                    ["FLR1-BC5", "FLR1-BC6", 4.8],["FLR1-BC6", "FLR1-BC5", 4.8],["FLR1-BC6", "FLR1-BC7", 6.2],["FLR1-BC7", "FLR1-BC6", 6.2],
                    ["FLR1-BC6", "FLR1-C2", 6.8],["FLR1-C2", "FLR1-BC6", 6.8],["FLR1-BC1", "FLR1-C9", 3],["FLR1-C9", "FLR1-BC1", 3],["FLR1-C9", "FLR1-BC10", 5],["FLR1-BC10", "FLR1-C9", 5]               
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
