require "test_helper"

class Admin::ShiftCorrectionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @admin_shift_correction = admin_shift_corrections(:one)
  end

  test "should get index" do
    get admin_shift_corrections_url
    assert_response :success
  end

  test "should get new" do
    get new_admin_shift_correction_url
    assert_response :success
  end

  test "should create admin_shift_correction" do
    assert_difference("Admin::ShiftCorrection.count") do
      post admin_shift_corrections_url, params: { admin_shift_correction: { description: @admin_shift_correction.description } }
    end

    assert_redirected_to admin_shift_correction_url(Admin::ShiftCorrection.last)
  end

  test "should show admin_shift_correction" do
    get admin_shift_correction_url(@admin_shift_correction)
    assert_response :success
  end

  test "should get edit" do
    get edit_admin_shift_correction_url(@admin_shift_correction)
    assert_response :success
  end

  test "should update admin_shift_correction" do
    patch admin_shift_correction_url(@admin_shift_correction), params: { admin_shift_correction: { description: @admin_shift_correction.description } }
    assert_redirected_to admin_shift_correction_url(@admin_shift_correction)
  end

  test "should destroy admin_shift_correction" do
    assert_difference("Admin::ShiftCorrection.count", -1) do
      delete admin_shift_correction_url(@admin_shift_correction)
    end

    assert_redirected_to admin_shift_corrections_url
  end
end
