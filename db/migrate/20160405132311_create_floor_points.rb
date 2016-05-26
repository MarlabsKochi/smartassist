class CreateFloorPoints < ActiveRecord::Migration
  def change
    create_table :floor_points do |t|
      t.string :floor_coordinates
      t.timestamps null: false
    end
  end
end
