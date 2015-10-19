class ReceptionController < ApplicationController
  def patients_near_by
    @patients = Appointment.where(:user_status_id => 1).pluck(:user_status_id)
  end
end
