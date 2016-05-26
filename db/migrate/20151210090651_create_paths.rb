class CreatePaths < ActiveRecord::Migration
  def change
    create_table :paths do |t|
      t.jsonb :nearest_points, default: {}
      t.jsonb :map, default: {}
      t.jsonb :co_ordinates, default: {}
      t.jsonb :copy, default: {}
      t.text :map_stored
      t.timestamps
    end

Path.create :map => {
              "one"=>["2","2"],
	      "two"=>["8","2"],
	      "three"=>["2","9"],
	      "four"=>["8","9"],
	             } ,  :map_stored => [{:id =>"A",:name =>"Hr",:xy=>"1,2",:near_node_details=>[{:direction=>"North",:distance=>5,:near_point=>"B"},{:direction=>"North West",:distance=>5,:near_point=>"C"}]}],                
            :co_ordinates => 
             {
              "one" => [[1,2],[3,2]] , 
       	      "two" =>[[7,2],[9,2]],
              "three"=> [[1,9],[3,9]],
              "four" => [[7,9],[9,9]],
             } , 
            :copy => {"one"=>["x"=>"2","y"=>"2","id" =>"one"],"two"=>["x"=>"8","y"=>"2"],"three"=>["x"=>"2","y"=>"9"],"four"=>["x"=>"8","y"=>"9"]}
   end
end
