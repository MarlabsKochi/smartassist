class ReceptionController < ApplicationController

  authorize_resource :class => false

  def patients_near_by
    @patients = Appointment.includes(:user).where(:user_status_id => 1)
  end
end
