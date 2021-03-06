class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :configure_permitted_parameters, if: :devise_controller?


  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << [:organisation_title, :project_description]
    devise_parameter_sanitizer.for(:account_update) << [:organisation_title, :project_description]
  end

  def after_sign_in_path_for(resource)
    "/requests/#{current_charity.id}"
  end

  def signed_in_root_path(resource)
    "/requests/#{current_charity.id}"
  end

end
