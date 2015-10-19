class ReceptionController < ApplicationController

  authorize_resource :class => false

  def patients_near_by
    @patients = Appointment.where(:user_status_id => 1).pluck(:user_status_id)
  end
end
