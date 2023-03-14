class DashboardController < ApplicationController

  def index
    @current_time = DateTime.now
    @current_date = @current_time.to_date
  end

end
