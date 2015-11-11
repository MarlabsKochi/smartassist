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
	  map ={"one"=>["-0.29","-2.09"],"two"=>["2.29","-1.09"],"three"=>["1.83","0.41"],"four"=>["-0.1","1.80"],"five"=>["-1.65","0.45"]}

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
	  end_point = map.key(end_point)

    paths_stored.each do |path|
        first_point = co_ordinates[path[0]]
        second_point = co_ordinates[path[1]]
       p = []
       p << first_point
       p first_point
    end

     #    if start_point
  	  #   ob = Dijkstra.new(start_point, end_point, paths_stored)
  	  #   paths = []
     #      ob.shortest_path.each {|a| paths<< copy[a]}
  	  #   response ={
  	  #     :cost => ob.cost,
     #        :path => paths
  	  #   }
  	  #  render_json(response)
  	  # else
  	  #   start_point = params[:start_point].split(",")
  	  #   end_point = params[:end_point].split(",") 
  	  # 	ary=[]
     #      map.each do |key, value|
     #        ary << [key,Math.sqrt((value.first.to_f - start_point.first.to_f)*(value.first.to_f - start_point.first.to_f) + (value.last.to_f - start_point.last.to_f)*(value.last.to_f - start_point.last.to_f))]
     #      end

     #      sorted=ary.sort_by{|x,y|y}

     #      start_point = map.key(start_point)
     #      end_point = map.key(end_point)
     #      three_elements=sorted[0,3]



     #      arrray = []
     #      costpath={}
     #      three_elements.each do |element|
     #        ob = Dijkstra.new(element.first, end_point, paths_stored) if element.first!=end_point
     #        paths = []
     #        #p  ob.shortest_path.uniq
     #        ob.shortest_path.each {|a| paths<< copy[a]}
  	  #     #costpath<<ob.cost
  	  #     #costpath<<paths
     #        costpath.merge!(ob.cost => paths.uniq)
     #        #p costpath
     #      end
     #      #p paths
     #      response ={ :path => costpath[costpath.keys.sort.first]}
     #      render_json(response)
  	  # end 
	end



    def find_nearest_node 
      paths_stored = [["one", "two", 1],["one", "three", 9],["one", "five", 3],["two", "four", 3],["two", "three", 7],["four", "three", 2],["four", "one", 1],["five", "two", 4],["five", "four", 2]]
      map ={"one"=>["1.83","0.41"],"two"=>["0.82","0.80"],"three"=>["-0.49","-1.09"],"four"=>["0.65","0.40"],"five"=>["-1.65","0.45"]}
      copy ={"one"=>["x"=>"1.83","y"=>"0.41"],"two"=>["x"=>"0.82","y"=>"0.80"],"three"=>["x"=>"-0.49","y"=>"-1.09"],"four"=>["x"=>"0.65","y"=>"0.40"],"five"=>["x"=>"-1.65","y"=>"0.45"]}

      start_point = params[:start_point].split(",")
      end_point = params[:end_point].split(",") 
      ary=[]
      map.each do |key, value|
        ary << [key,Math.sqrt((value.first.to_f - start_point.first.to_f)*(value.first.to_f - start_point.first.to_f) + (value.last.to_f - start_point.last.to_f)*(value.last.to_f - start_point.last.to_f))]
      end
      p sorted=ary.sort_by{|x,y|y}
      #start_point = ["1.70","0.30"]
      #end_point = ["-1.65","0.45"]
      start_point = map.key(start_point)
      end_point = map.key(end_point)
      three_elements=sorted[0,3]
      arrray = []
      costpath={}
      three_elements.each do |element|
        ob = Dijkstra.new(element.first, end_point, paths_stored)
        paths = []
        ob.shortest_path.each {|a| paths<< copy[a]}
        #costpath<<ob.cost
        #costpath<<paths
        costpath.merge!(ob.cost => paths)
      end
      p costpath
      response ={
      	:result => costpath[costpath.keys.sort.first]
      }
      render_json(response)
    end	
end