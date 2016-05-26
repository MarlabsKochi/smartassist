class AddWidthToFloorMap < ActiveRecord::Migration
  def change
    add_column :floor_maps, :width, :string
  end
end
