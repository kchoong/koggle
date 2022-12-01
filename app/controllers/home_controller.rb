class HomeController < ApplicationController

  def index

  end

  def switch_locale
    locale = params[:locale]
    I18n.locale = locale
    session[:locale] = locale
    redirect_to root_path
  end

end
