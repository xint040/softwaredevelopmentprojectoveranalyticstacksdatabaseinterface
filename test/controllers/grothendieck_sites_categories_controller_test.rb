require "test_helper"

class GrothendieckSitesCategoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @grothendieck_sites_category = grothendieck_sites_categories(:one)
  end

  test "should get index" do
    get grothendieck_sites_categories_url
    assert_response :success
  end

  test "should get new" do
    get new_grothendieck_sites_category_url
    assert_response :success
  end

  test "should create grothendieck_sites_category" do
    assert_difference("GrothendieckSitesCategory.count") do
      post grothendieck_sites_categories_url, params: { grothendieck_sites_category: { grothendieck_sites_description: @grothendieck_sites_category.grothendieck_sites_description, grothendieck_topologies: @grothendieck_sites_category.grothendieck_topologies, underlying_rings_category: @grothendieck_sites_category.underlying_rings_category } }
    end

    assert_redirected_to grothendieck_sites_category_url(GrothendieckSitesCategory.last)
  end

  test "should show grothendieck_sites_category" do
    get grothendieck_sites_category_url(@grothendieck_sites_category)
    assert_response :success
  end

  test "should get edit" do
    get edit_grothendieck_sites_category_url(@grothendieck_sites_category)
    assert_response :success
  end

  test "should update grothendieck_sites_category" do
    patch grothendieck_sites_category_url(@grothendieck_sites_category), params: { grothendieck_sites_category: { grothendieck_sites_description: @grothendieck_sites_category.grothendieck_sites_description, grothendieck_topologies: @grothendieck_sites_category.grothendieck_topologies, underlying_rings_category: @grothendieck_sites_category.underlying_rings_category } }
    assert_redirected_to grothendieck_sites_category_url(@grothendieck_sites_category)
  end

  test "should destroy grothendieck_sites_category" do
    assert_difference("GrothendieckSitesCategory.count", -1) do
      delete grothendieck_sites_category_url(@grothendieck_sites_category)
    end

    assert_redirected_to grothendieck_sites_categories_url
  end
end
