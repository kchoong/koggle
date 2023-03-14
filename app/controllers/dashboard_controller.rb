class DashboardController < ApplicationController

  def index
    unless user_signed_in?
      redirect_to root_path
    end

    @current_time = DateTime.now
    @current_date = @current_time.to_date
  end

end
