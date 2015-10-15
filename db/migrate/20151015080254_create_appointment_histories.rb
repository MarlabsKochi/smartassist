class CreateAppointmentHistories < ActiveRecord::Migration
  def change
    create_table :appointment_histories do |t|
      t.references :appointment
      t.integer :user_status
      t.integer :user
      t.jsonb :appointment_details
      t.datetime :updated_at
    end
  end
end
