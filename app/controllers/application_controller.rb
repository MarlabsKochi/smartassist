class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  rescue_from CanCan::AccessDenied do |exception|
    respond_to do |format|
      format.json { render nothing: true, status: :forbidden }
      format.html do 
        if current_user
          redirect_to main_app.authenticated_root_url, :alert => exception.message
        else 
          redirect_to main_app.unauthenticated_root_url, :alert => exception.message
        end
      end
    end
  end
end
