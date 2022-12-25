class ApplicationController < ActionController::Base

  # Add flash types
  add_flash_types :success, :danger, :warning, :info # :primary, :secondary, :light, :dark

  # Before actions
  before_action :configure_permitted_parameters, if: :devise_controller?

  before_action :set_locale

  protected

  def configure_permitted_parameters
    added_attrs = [:username, :email, :password, :password_confirmation, :remember_me]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :sign_in, keys: [:login, :password]
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end

  # Set locale for every request from session
  def set_locale
    I18n.locale = session[:locale] || I18n.default_locale
  end
  
end
