class HomeController < ApplicationController

  def index
    if user_signed_in?
      redirect_to dashboard_path
    end
  end

  def switch_locale
    locale = params[:locale]
    I18n.locale = locale
    session[:locale] = locale
    redirect_to root_path
  end

end
