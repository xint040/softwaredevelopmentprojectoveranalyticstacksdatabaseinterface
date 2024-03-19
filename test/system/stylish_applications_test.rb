require "application_system_test_case"

class StylishApplicationsTest < ApplicationSystemTestCase
  setup do
    @stylish_application = stylish_applications(:one)
  end

  test "visiting the index" do
    visit stylish_applications_url
    assert_selector "h1", text: "Stylish applications"
  end

  test "should create stylish application" do
    visit stylish_applications_url
    click_on "New stylish application"

    fill_in "Stylish applications references", with: @stylish_application.stylish_applications_references
    fill_in "Stylish applications related authors", with: @stylish_application.stylish_applications_related_authors
    fill_in "Stylish applications related text", with: @stylish_application.stylish_applications_related_text
    fill_in "Stylish applications title", with: @stylish_application.stylish_applications_title
    click_on "Create Stylish application"

    assert_text "Stylish application was successfully created"
    click_on "Back"
  end

  test "should update Stylish application" do
    visit stylish_application_url(@stylish_application)
    click_on "Edit this stylish application", match: :first

    fill_in "Stylish applications references", with: @stylish_application.stylish_applications_references
    fill_in "Stylish applications related authors", with: @stylish_application.stylish_applications_related_authors
    fill_in "Stylish applications related text", with: @stylish_application.stylish_applications_related_text
    fill_in "Stylish applications title", with: @stylish_application.stylish_applications_title
    click_on "Update Stylish application"

    assert_text "Stylish application was successfully updated"
    click_on "Back"
  end

  test "should destroy Stylish application" do
    visit stylish_application_url(@stylish_application)
    click_on "Destroy this stylish application", match: :first

    assert_text "Stylish application was successfully destroyed"
  end
end
