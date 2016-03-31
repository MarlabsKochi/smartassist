class Api::V1::ChecksController < Api::V1::BaseController
   

  def initialize_floor_map
      map_stored = [
      {:id =>"FLR1-BC1",:name =>"ENTRANCE",:xy=>"",:near_node_details=>[{:direction=>"EAST",:distance=>1.8,:near_point=>"FLR1-C2"},{:direction=>"WEST",:distance=>3,:near_point=>"FLR1-C3"}]},
      {:id =>"FLR1-C3",:name =>"FIRST TURN",:xy=>"",:near_node_details=>[{:direction=>"EAST",:distance=>3,:near_point=>"FLR1-BC1"},{:direction=>"NORTH",:distance=>3,:near_point=>"FLR1-BC4"}]},
      {:id =>"FLR1-BC4",:name =>"REST ROOM",:xy=>"",:near_node_details=>[{:direction=>"SOUTH",:distance=>3,:near_point=>"FLR1-C3"},{:direction=>"NORTH",:distance=>3.8,:near_point=>"FLR1-BC5"}]},
      {:id =>"FLR1-BC5",:name =>"EAST TOWER",:xy=>"",:near_node_details=>[{:direction=>"SOUTH",:distance=>3.8,:near_point=>"FLR1-BC4"},{:direction=>"NORTH",:distance=>4.8,:near_point=>"FLR1-C6"}]},
      {:id =>"FLR1-C6",:name =>"EMERGENCY DEPT",:xy=>"",:near_node_details=>[{:direction=>"SOUTH WEST",:distance=>4.8,:near_point=>"FLR1-BC5"},{:direction=>"SOUTH EAST",:distance=>6.8,:near_point=>"FLR1-C2"},{:direction=>"NORTH EAST",:distance=>6.2,:near_point=>"FLR1-BC7"}]},
      {:id =>"FLR1-BC7",:name =>"EMERGENCY DEPT",:xy=>"",:near_node_details=>[{:direction=>"SOUTH WEST",:distance=>6.2,:near_point=>"FLR1-BC7"}]}
      ]
      render_json(map_stored) 
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
