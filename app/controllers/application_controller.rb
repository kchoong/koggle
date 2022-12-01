class ApplicationController < ActionController::Base
  # Add flash types
  add_flash_types :info, :error, :success

  # Set locale for every request from session
  def set_locale
    I18n.locale = session[:locale] || I18n.default_locale
  end

  before_action :set_locale
end
