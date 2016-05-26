class CreateFloorMaps < ActiveRecord::Migration
  def change
    create_table :floor_maps do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
