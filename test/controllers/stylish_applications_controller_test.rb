require "test_helper"

class StylishApplicationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @stylish_application = stylish_applications(:one)
  end

  test "should get index" do
    get stylish_applications_url
    assert_response :success
  end

  test "should get new" do
    get new_stylish_application_url
    assert_response :success
  end

  test "should create stylish_application" do
    assert_difference("StylishApplication.count") do
      post stylish_applications_url, params: { stylish_application: { stylish_applications_references: @stylish_application.stylish_applications_references, stylish_applications_related_authors: @stylish_application.stylish_applications_related_authors, stylish_applications_related_text: @stylish_application.stylish_applications_related_text, stylish_applications_title: @stylish_application.stylish_applications_title } }
    end

    assert_redirected_to stylish_application_url(StylishApplication.last)
  end

  test "should show stylish_application" do
    get stylish_application_url(@stylish_application)
    assert_response :success
  end

  test "should get edit" do
    get edit_stylish_application_url(@stylish_application)
    assert_response :success
  end

  test "should update stylish_application" do
    patch stylish_application_url(@stylish_application), params: { stylish_application: { stylish_applications_references: @stylish_application.stylish_applications_references, stylish_applications_related_authors: @stylish_application.stylish_applications_related_authors, stylish_applications_related_text: @stylish_application.stylish_applications_related_text, stylish_applications_title: @stylish_application.stylish_applications_title } }
    assert_redirected_to stylish_application_url(@stylish_application)
  end

  test "should destroy stylish_application" do
    assert_difference("StylishApplication.count", -1) do
      delete stylish_application_url(@stylish_application)
    end

    assert_redirected_to stylish_applications_url
  end
end
