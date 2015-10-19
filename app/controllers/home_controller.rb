class HomeController < ApplicationController
  def index
  end

  def patient_near_by
    @patients = Appointment.where(:user_status_id => 1).pluck(:user_status_id)
  end
end
