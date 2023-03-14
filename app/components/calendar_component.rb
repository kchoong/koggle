# frozen_string_literal: true

class CalendarComponent < ViewComponent::Base

  def initialize(date:)
    calendar(date)
    birthdays
  end

  def calendar(date)
    @month = date.month
    @year = date.year
    selected_date = Date.new(@year, @month, 1)

    # Build days array
    day = 1
    days_in_month = Time.days_in_month(@month, @year)
    first_weekday = selected_date.wday
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
    @highlight_day = date.day # if @year == date.year && @month == date.month

    # Set title
    @title = l(selected_date, :format => :month_year)
  end

  def birthdays
    @workers_birthday_today = Worker.where(birthday: Date.new(1986, 2, 22))
  end

end
