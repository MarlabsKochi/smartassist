class Api::V1::PathsController < Api::V1::BaseController

	def dummy
	  paths_stored = [["one", "two", 4],
	  ["two", "one", 4],
	  ["two", "three", 2],
	  ["three", "two", 2],
	  ["three", "four", 1],
	  ["four", "three", 1],
	  ["four", "five", 3],
	  ["five", "four", 3],
	  ["five", "one", 2],
      ["one", "five", 2],
	]
	  map =
	  {"one"=>["-0.29","-2.09"],
	    "two"=>["2.29","-1.09"],
	    "three"=>["1.83","0.41"],
	    "four"=>["-0.1","1.80"],
	    "five"=>["-1.65","0.45"]
	   }

     co_ordinates = {"one" => [[-1.29,-2.09],[0.71,-2.09]] , 
       	"two" =>[[1.29,-1.09],[3.29,-1.09]],
          "three"=> [[0.83,0.41],[2.83,0.41]],
           "four" => [[-1.1,1.80],[1.1,1.80]],
           "five" => [[-2.65,0.45],[0.65,0.45]]
      }

      copy ={"one"=>["x"=>"-0.29","y"=>"-2.09"],"two"=>["x"=>"2.29","y"=>"-1.09"],"three"=>["x"=>"1.83","y"=>"0.41"],"four"=>["x"=>"-0.1","y"=>"1.80"],"five"=>["x"=>"-1.65","y"=>"0.45"]}


	  start_point = params[:start_point].split(",")
	  end_point = params[:end_point].split(",") 
	  start_point = map.key(start_point)
          starts = start_point
	  end_point = map.key(end_point)
    #starts = ""
    unless start_point          
      paths_stored.each do |path|
      start_point = params[:start_point].split(",")
      starts = path[0]
      first_point = co_ordinates[path[0]]
      second_point = co_ordinates[path[1]]
      one_one= first_point.first.first
      one_two= first_point.first.last
      two_one= first_point.last.first
      two_two= first_point.last.last
      three_one= second_point.first.first
      three_two = second_point.first.last
      four_one = second_point.last.first
      four_two = second_point.last.last
      p = [] 
      p << Point[one_one, one_two, 0]
      p << Point[two_one,two_two,0]
      p << Point[three_one,three_two,0]
      p << Point[four_one,four_two,0]
      target = Point[start_point.first.to_f, start_point.last.to_f, 0]
      a = Polygon.new(p)
       status = a.isInside(target)
       p start_point
       p status
      break if status==1

    end
  end
        
  	     ob = Dijkstra.new(starts,end_point, paths_stored)
  	     paths = []
           ob.shortest_path.each {|a| paths<< copy[a]}
  	     response ={
  	       :cost => ob.cost,
             :path => paths
  	     }
       
      

  	   render_json(response) 
	end
	
end
