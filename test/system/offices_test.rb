require "application_system_test_case"

class OfficesTest < ApplicationSystemTestCase
  setup do
    @office = offices(:one)
  end

  test "visiting the index" do
    visit offices_url
    assert_selector "h1", text: "Offices"
  end

  test "should create office" do
    visit offices_url
    click_on "New office"

    fill_in "Address 1", with: @office.address_1
    fill_in "Address 2", with: @office.address_2
    fill_in "City", with: @office.city
    fill_in "Country", with: @office.country
    fill_in "Description", with: @office.description
    fill_in "Name", with: @office.name
    fill_in "Postcode", with: @office.postcode
    click_on "Create Office"

    assert_text "Office was successfully created"
    click_on "Back"
  end

  test "should update Office" do
    visit office_url(@office)
    click_on "Edit this office", match: :first

    fill_in "Address 1", with: @office.address_1
    fill_in "Address 2", with: @office.address_2
    fill_in "City", with: @office.city
    fill_in "Country", with: @office.country
    fill_in "Description", with: @office.description
    fill_in "Name", with: @office.name
    fill_in "Postcode", with: @office.postcode
    click_on "Update Office"

    assert_text "Office was successfully updated"
    click_on "Back"
  end

  test "should destroy Office" do
    visit office_url(@office)
    click_on "Destroy this office", match: :first

    assert_text "Office was successfully destroyed"
  end
end
