require "test_helper"

class RingsCategoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @rings_category = rings_categories(:one)
  end

  test "should get index" do
    get rings_categories_url
    assert_response :success
  end

  test "should get new" do
    get new_rings_category_url
    assert_response :success
  end

  test "should create rings_category" do
    assert_difference("RingsCategory.count") do
      post rings_categories_url, params: { rings_category: { Clausen_Scholze_analytic_1_more_adic_style: @rings_category.Clausen_Scholze_analytic_1_more_adic_style, Clausen_Scholze_analytic_2_more_categorical_flavor: @rings_category.Clausen_Scholze_analytic_2_more_categorical_flavor, adic: @rings_category.adic, condensed: @rings_category.condensed, indBanach: @rings_category.indBanach, indnormed: @rings_category.indnormed, indseminormed: @rings_category.indseminormed, monomorphicindBanach: @rings_category.monomorphicindBanach, monomorphicindnormed: @rings_category.monomorphicindnormed, monomorphicindseminormed: @rings_category.monomorphicindseminormed, perfectoid: @rings_category.perfectoid, rings_categories_charactaristics: @rings_category.rings_categories_charactaristics, rings_categories_description: @rings_category.rings_categories_description, topologies_on_the_rings: @rings_category.topologies_on_the_rings } }
    end

    assert_redirected_to rings_category_url(RingsCategory.last)
  end

  test "should show rings_category" do
    get rings_category_url(@rings_category)
    assert_response :success
  end

  test "should get edit" do
    get edit_rings_category_url(@rings_category)
    assert_response :success
  end

  test "should update rings_category" do
    patch rings_category_url(@rings_category), params: { rings_category: { Clausen_Scholze_analytic_1_more_adic_style: @rings_category.Clausen_Scholze_analytic_1_more_adic_style, Clausen_Scholze_analytic_2_more_categorical_flavor: @rings_category.Clausen_Scholze_analytic_2_more_categorical_flavor, adic: @rings_category.adic, condensed: @rings_category.condensed, indBanach: @rings_category.indBanach, indnormed: @rings_category.indnormed, indseminormed: @rings_category.indseminormed, monomorphicindBanach: @rings_category.monomorphicindBanach, monomorphicindnormed: @rings_category.monomorphicindnormed, monomorphicindseminormed: @rings_category.monomorphicindseminormed, perfectoid: @rings_category.perfectoid, rings_categories_charactaristics: @rings_category.rings_categories_charactaristics, rings_categories_description: @rings_category.rings_categories_description, topologies_on_the_rings: @rings_category.topologies_on_the_rings } }
    assert_redirected_to rings_category_url(@rings_category)
  end

  test "should destroy rings_category" do
    assert_difference("RingsCategory.count", -1) do
      delete rings_category_url(@rings_category)
    end

    assert_redirected_to rings_categories_url
  end
end
