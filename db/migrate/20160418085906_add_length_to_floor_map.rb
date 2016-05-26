class AddLengthToFloorMap < ActiveRecord::Migration
  def change
    add_column :floor_maps, :length, :string
  end
end
