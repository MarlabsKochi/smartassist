class CreateUserStatuses < ActiveRecord::Migration
  def change
    create_table :user_statuses do |t|
      t.string :name
 
      t.timestamps null: false
    end
  end
end
