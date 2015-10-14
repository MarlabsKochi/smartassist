class AddMessageToBeacons < ActiveRecord::Migration
  def change
    add_column :beacons, :message, :string
  end
end
