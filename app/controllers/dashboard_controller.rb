class DashboardController < ApplicationController

  def index

  end

  def calendar
    selected_time = Time.new(params[:year].to_i, params[:month].to_i, 1)
    year = selected_time.year
    month = selected_time.month
    selected_time = Time.new(year, month, 1)

    # Build days array
    day = 1
    days_in_month = Time.days_in_month(month, year)
    first_weekday = selected_time.wday
    @calendar_matrix = []
    for i in (0..5) do
      days_row = []
      for j in (0..6) do
        if (i == 0 && j < first_weekday) || day > days_in_month
          days_row << ""
        else
          days_row << day
          day = day + 1
        end
      end
      @calendar_matrix << days_row

      break if day > days_in_month
    end

    # Check, if shown month is the current month
    current_time = DateTime.now
    @highlight_day = current_time.day if year == current_time.year && month == current_time.month

    # Set title
    @title = l(current_time, :format => :month_year)

    render "dashboard/calendar", layout: false
  end

end
