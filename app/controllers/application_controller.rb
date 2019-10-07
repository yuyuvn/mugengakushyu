class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_filter :configure_permitted_parameters, if: :devise_controller?
  
  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up).concat [:name, :gender ,:age]
    devise_parameter_sanitizer.for(:account_update).concat [:name, :gender ,:age]
  end
end
