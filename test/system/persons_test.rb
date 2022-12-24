require "application_system_test_case"

class PersonsTest < ApplicationSystemTestCase
  setup do
    @person = persons(:one)
  end

  test "visiting the index" do
    visit persons_url
    assert_selector "h1", text: "Persons"
  end

  test "should create person" do
    visit persons_url
    click_on "New person"

    fill_in "Birthday", with: @person.birthday
    fill_in "Firstname", with: @person.firstname
    fill_in "Gender", with: @person.gender
    fill_in "Lastname", with: @person.lastname
    fill_in "Profession", with: @person.profession
    fill_in "Title", with: @person.title
    click_on "Create Person"

    assert_text "Person was successfully created"
    click_on "Back"
  end

  test "should update Person" do
    visit person_url(@person)
    click_on "Edit this person", match: :first

    fill_in "Birthday", with: @person.birthday
    fill_in "Firstname", with: @person.firstname
    fill_in "Gender", with: @person.gender
    fill_in "Lastname", with: @person.lastname
    fill_in "Profession", with: @person.profession
    fill_in "Title", with: @person.title
    click_on "Update Person"

    assert_text "Person was successfully updated"
    click_on "Back"
  end

  test "should destroy Person" do
    visit person_url(@person)
    click_on "Destroy this person", match: :first

    assert_text "Person was successfully destroyed"
  end
end
