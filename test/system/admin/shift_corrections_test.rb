require "application_system_test_case"

class Admin::ShiftCorrectionsTest < ApplicationSystemTestCase
  setup do
    @admin_shift_correction = admin_shift_corrections(:one)
  end

  test "visiting the index" do
    visit admin_shift_corrections_url
    assert_selector "h1", text: "Shift corrections"
  end

  test "should create shift correction" do
    visit admin_shift_corrections_url
    click_on "New shift correction"

    fill_in "Description", with: @admin_shift_correction.description
    click_on "Create Shift correction"

    assert_text "Shift correction was successfully created"
    click_on "Back"
  end

  test "should update Shift correction" do
    visit admin_shift_correction_url(@admin_shift_correction)
    click_on "Edit this shift correction", match: :first

    fill_in "Description", with: @admin_shift_correction.description
    click_on "Update Shift correction"

    assert_text "Shift correction was successfully updated"
    click_on "Back"
  end

  test "should destroy Shift correction" do
    visit admin_shift_correction_url(@admin_shift_correction)
    click_on "Destroy this shift correction", match: :first

    assert_text "Shift correction was successfully destroyed"
  end
end
