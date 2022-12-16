module DateHelper

  def calendar_month(year, month)
    # selected_time = Time.new(params[:year].to_i, params[:month].to_i, 1)
    selected_time = Time.new(year, month, 1)
    year = selected_time.year
    month = selected_time.month

    # Build days array
    day = 1
    days_in_month = Time.days_in_month(month, year)
    first_weekday = selected_time.wday
    calendar_matrix = []
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
      calendar_matrix << days_row

      if day > days_in_month
        break
      end
    end

    # Check, if shown month is the current month
    current_time = Time.now
    if year == current_time.year && month == current_time.month
      highlight_day = current_time.day
    end

    # Set previous and next month for switching months
    # previous_month = selected_time - 1.month
    # next_month = selected_time + 1.month

    render "application/calendar", calendar_matrix: calendar_matrix, highlight_day: highlight_day, title: l(DateTime.now, :format => :month_year)
  end

  def format_time(time)
    return "–" if time.nil?

    if time > 1.days.ago
      return t("time.ago", time: distance_of_time_in_words_to_now(time))
    end

    l(time, :format => :long)
  end

end
