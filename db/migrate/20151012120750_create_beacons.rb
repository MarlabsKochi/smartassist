class CreateBeacons < ActiveRecord::Migration
  def change
    create_table :beacons do |t|
      t.string :uuid
      t.string :major_number
      t.string :minor_number
      t.string :service_point_name

      t.timestamps null: false
    end
  end
end
