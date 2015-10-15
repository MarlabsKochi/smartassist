class CreateAppointments < ActiveRecord::Migration
  def change
    create_table :appointments do |t|
      t.references :user_status
      t.references :user
      t.jsonb :appointment_details
      t.timestamps null: false
    end
  end
end
