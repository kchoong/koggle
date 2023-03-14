require "test_helper"

class WorkerTest < ActiveSupport::TestCase

  test "name" do
    worker_1 = workers(:one)
    assert worker_1.name == "Raylene Rau"

    worker_2 = workers(:two)
    assert worker_2.name == "Magdalena Lowe"
  end

  test "full address" do
    worker_1 = workers(:one)
    assert worker_1.full_address == "965 Danuta Groves, Suite 375, 13768, Nickolasborough, Tokelau"

    worker_2 = workers(:two)
    assert worker_2.full_address == "38242 Treutel Camp, Suite 670, 72259, Lake Malcolm, Nepal"
  end

  test "pin unique presence" do
    worker_1 = Worker.new(first_name: "Raylene", last_name: "Rau", work_hours: 100, vacation_days: 10)
    assert_not worker_1.save

    worker_2 = Worker.new(first_name: "Raylene", last_name: "Rau", work_hours: 100, vacation_days: 10, pin: "123456")
    assert_not worker_2.save

    worker_3 = Worker.new(first_name: "Raylene", last_name: "Rau", work_hours: 100, vacation_days: 10, pin: "qwerty")
    assert worker_3.save
  end

end
