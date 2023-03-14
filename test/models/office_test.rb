require "test_helper"

class OfficeTest < ActiveSupport::TestCase

  test "full address" do
    office_1 = offices(:one)
    assert office_1.full_address == "945 Hermiston Flat, Apt. 126, 71554, Soohaven, Chad"

    office_2 = offices(:two)
    assert office_2.full_address == "541 Fisher Crescent, Apt. 740, 37581, Port Sheltonport, Latvia"
  end

  test "name unique presence" do
    office_1 = Office.new
    assert_not office_1.save

    office_2 = Office.new(name: "Oxygen")
    assert_not office_2.save

    office_3 = Office.new(name: "Helium")
    assert office_3.save
  end

end
