class DashboardController < ApplicationController

  def index
    unless user_signed_in?
      redirect_to root_path
    end

    @current_time = DateTime.now
    @current_date = @current_time.to_date

    @active_shifts = helpers.get_active_shifts(current_user.worker)
    shifts_current_week = helpers.get_shifts_current_week(current_user.worker)
    @graph_shifts_data = shifts_current_week.group_by_day { |u| u.start_time }.to_h { |k, v| [k, helpers.sum_duration(v)] }
  end

end
