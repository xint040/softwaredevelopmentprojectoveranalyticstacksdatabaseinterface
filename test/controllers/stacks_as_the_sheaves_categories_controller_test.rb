require "test_helper"

class StacksAsTheSheavesCategoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @stacks_as_the_sheaves_category = stacks_as_the_sheaves_categories(:one)
  end

  test "should get index" do
    get stacks_as_the_sheaves_categories_url
    assert_response :success
  end

  test "should get new" do
    get new_stacks_as_the_sheaves_category_url
    assert_response :success
  end

  test "should create stacks_as_the_sheaves_category" do
    assert_difference("StacksAsTheSheavesCategory.count") do
      post stacks_as_the_sheaves_categories_url, params: { stacks_as_the_sheaves_category: { sheafification_from_the_prestacks_as_the_presheaves_category: @stacks_as_the_sheaves_category.sheafification_from_the_prestacks_as_the_presheaves_category, stacks_as_the_sheaves_categories_description: @stacks_as_the_sheaves_category.stacks_as_the_sheaves_categories_description, stacks_as_the_sheaves_categories_over_topologies_can_be_realized: @stacks_as_the_sheaves_category.stacks_as_the_sheaves_categories_over_topologies_can_be_realized, stacks_as_the_sheaves_categories_target_categories: @stacks_as_the_sheaves_category.stacks_as_the_sheaves_categories_target_categories } }
    end

    assert_redirected_to stacks_as_the_sheaves_category_url(StacksAsTheSheavesCategory.last)
  end

  test "should show stacks_as_the_sheaves_category" do
    get stacks_as_the_sheaves_category_url(@stacks_as_the_sheaves_category)
    assert_response :success
  end

  test "should get edit" do
    get edit_stacks_as_the_sheaves_category_url(@stacks_as_the_sheaves_category)
    assert_response :success
  end

  test "should update stacks_as_the_sheaves_category" do
    patch stacks_as_the_sheaves_category_url(@stacks_as_the_sheaves_category), params: { stacks_as_the_sheaves_category: { sheafification_from_the_prestacks_as_the_presheaves_category: @stacks_as_the_sheaves_category.sheafification_from_the_prestacks_as_the_presheaves_category, stacks_as_the_sheaves_categories_description: @stacks_as_the_sheaves_category.stacks_as_the_sheaves_categories_description, stacks_as_the_sheaves_categories_over_topologies_can_be_realized: @stacks_as_the_sheaves_category.stacks_as_the_sheaves_categories_over_topologies_can_be_realized, stacks_as_the_sheaves_categories_target_categories: @stacks_as_the_sheaves_category.stacks_as_the_sheaves_categories_target_categories } }
    assert_redirected_to stacks_as_the_sheaves_category_url(@stacks_as_the_sheaves_category)
  end

  test "should destroy stacks_as_the_sheaves_category" do
    assert_difference("StacksAsTheSheavesCategory.count", -1) do
      delete stacks_as_the_sheaves_category_url(@stacks_as_the_sheaves_category)
    end

    assert_redirected_to stacks_as_the_sheaves_categories_url
  end
end
