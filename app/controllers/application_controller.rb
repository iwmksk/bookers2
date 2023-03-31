class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    if request.fullpath == user_session_path
      flash[:notice] = "Signed in successfully."
    else
      flash[:notice] = "Welcome! You have signed up successfully."
    end
    user_path(resource)
  end



  def after_sign_out_path_for(resource)
    flash[:notice] = "Signed out successfully."
    root_path
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email])
  end

end
