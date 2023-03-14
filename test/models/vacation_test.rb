require "test_helper"

class VacationTest < ActiveSupport::TestCase

  test "presence" do
    vacation_1 = Vacation.new
    assert_not vacation_1.save

    vacation_2 = Vacation.new(start_date: Date.today.beginning_of_month)
    assert_not vacation_2.save

    vacation_3 = Vacation.new(start_date: Date.today.beginning_of_day, end_date: Date.today.end_of_day)
    assert_not vacation_3.save

    vacation_4 = Vacation.new(start_date: Date.today.beginning_of_day, end_date: Date.today.end_of_day, worker: workers(:one))
    assert vacation_4.save
  end

  test "duration" do
    vacation_1 = vacations(:one)
    assert vacation_1.duration == 9

    vacation_2 = vacations(:two)
    assert vacation_2.duration == 14
  end

end
