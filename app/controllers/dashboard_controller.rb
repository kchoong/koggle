class DashboardController < ApplicationController

  def index
    unless user_signed_in?
      redirect_to root_path
    end

    @current_time = DateTime.now
    @current_date = @current_time.to_date

    @active_shifts = helpers.get_active_shifts(current_user.worker)
  end

end
