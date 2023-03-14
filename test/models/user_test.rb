require "test_helper"

class UserTest < ActiveSupport::TestCase

  test "login" do
    admin = users(:one)
    assert admin.valid_password?("admin1")

    user = users(:two)
    assert user.valid_password?("testuser1")
  end

  test "is admin" do
    admin = users(:one)
    assert admin.admin

    user = users(:two)
    assert_not user.admin
  end

  test "username unique" do
    user_1 = User.new(username: "admin1", email: "newnew1@mail.azg", password: "admin1")
    assert_not user_1.save

    user_2 = User.new(username: "Admin1", email: "newnew1@mail.azg", password: "admin1")
    assert_not user_2.save
  end

  test "email unique" do
    user_1 = User.new(username: "newnew1", email: "admin1@mail.azg", password: "admin1")
    assert_not user_1.save

    user_2 = User.new(username: "newnew1", email: "Admin1@mail.azg", password: "admin1")
    assert_not user_2.save
  end

  test "required fields" do
    user = User.new
    assert_not user.save
  end

end
