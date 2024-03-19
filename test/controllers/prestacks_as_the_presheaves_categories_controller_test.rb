require "test_helper"

class PrestacksAsThePresheavesCategoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @prestacks_as_the_presheaves_category = prestacks_as_the_presheaves_categories(:one)
  end

  test "should get index" do
    get prestacks_as_the_presheaves_categories_url
    assert_response :success
  end

  test "should get new" do
    get new_prestacks_as_the_presheaves_category_url
    assert_response :success
  end

  test "should create prestacks_as_the_presheaves_category" do
    assert_difference("PrestacksAsThePresheavesCategory.count") do
      post prestacks_as_the_presheaves_categories_url, params: { prestacks_as_the_presheaves_category: { prestacks_as_the_presheaves_categories_description: @prestacks_as_the_presheaves_category.prestacks_as_the_presheaves_categories_description, prestacks_as_the_presheaves_categories_target_categories: @prestacks_as_the_presheaves_category.prestacks_as_the_presheaves_categories_target_categories, underlying_grothendieck_sites_category: @prestacks_as_the_presheaves_category.underlying_grothendieck_sites_category } }
    end

    assert_redirected_to prestacks_as_the_presheaves_category_url(PrestacksAsThePresheavesCategory.last)
  end

  test "should show prestacks_as_the_presheaves_category" do
    get prestacks_as_the_presheaves_category_url(@prestacks_as_the_presheaves_category)
    assert_response :success
  end

  test "should get edit" do
    get edit_prestacks_as_the_presheaves_category_url(@prestacks_as_the_presheaves_category)
    assert_response :success
  end

  test "should update prestacks_as_the_presheaves_category" do
    patch prestacks_as_the_presheaves_category_url(@prestacks_as_the_presheaves_category), params: { prestacks_as_the_presheaves_category: { prestacks_as_the_presheaves_categories_description: @prestacks_as_the_presheaves_category.prestacks_as_the_presheaves_categories_description, prestacks_as_the_presheaves_categories_target_categories: @prestacks_as_the_presheaves_category.prestacks_as_the_presheaves_categories_target_categories, underlying_grothendieck_sites_category: @prestacks_as_the_presheaves_category.underlying_grothendieck_sites_category } }
    assert_redirected_to prestacks_as_the_presheaves_category_url(@prestacks_as_the_presheaves_category)
  end

  test "should destroy prestacks_as_the_presheaves_category" do
    assert_difference("PrestacksAsThePresheavesCategory.count", -1) do
      delete prestacks_as_the_presheaves_category_url(@prestacks_as_the_presheaves_category)
    end

    assert_redirected_to prestacks_as_the_presheaves_categories_url
  end
end
