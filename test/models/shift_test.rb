require "test_helper"

class ShiftTest < ActiveSupport::TestCase

  test "presence" do
    shift_1 = Shift.new
    assert_not shift_1.save

    shift_2 = Shift.new(start_time: DateTime.new.beginning_of_day)
    assert_not shift_2.save

    shift_3 = Shift.new(start_time: DateTime.new.beginning_of_day, end_time: Date.new.end_of_day)
    assert_not shift_3.save

    shift_4 = Shift.new(start_time: DateTime.new.beginning_of_day, end_time: Date.new.end_of_day, worker: workers(:one), office: offices(:one))
    assert shift_4.save
  end

  test "duration" do
    shift_1 = shifts(:one)
    assert shift_1.duration.to_s == "617.6"

    shift_2 = shifts(:two)
    assert shift_2.duration.to_s == "527.1"
  end
end
