require "application_system_test_case"

class GrothendieckSitesCategoriesTest < ApplicationSystemTestCase
  setup do
    @grothendieck_sites_category = grothendieck_sites_categories(:one)
  end

  test "visiting the index" do
    visit grothendieck_sites_categories_url
    assert_selector "h1", text: "Grothendieck sites categories"
  end

  test "should create grothendieck sites category" do
    visit grothendieck_sites_categories_url
    click_on "New grothendieck sites category"

    fill_in "Grothendieck sites description", with: @grothendieck_sites_category.grothendieck_sites_description
    fill_in "Grothendieck topologies", with: @grothendieck_sites_category.grothendieck_topologies
    fill_in "Underlying rings category", with: @grothendieck_sites_category.underlying_rings_category
    click_on "Create Grothendieck sites category"

    assert_text "Grothendieck sites category was successfully created"
    click_on "Back"
  end

  test "should update Grothendieck sites category" do
    visit grothendieck_sites_category_url(@grothendieck_sites_category)
    click_on "Edit this grothendieck sites category", match: :first

    fill_in "Grothendieck sites description", with: @grothendieck_sites_category.grothendieck_sites_description
    fill_in "Grothendieck topologies", with: @grothendieck_sites_category.grothendieck_topologies
    fill_in "Underlying rings category", with: @grothendieck_sites_category.underlying_rings_category
    click_on "Update Grothendieck sites category"

    assert_text "Grothendieck sites category was successfully updated"
    click_on "Back"
  end

  test "should destroy Grothendieck sites category" do
    visit grothendieck_sites_category_url(@grothendieck_sites_category)
    click_on "Destroy this grothendieck sites category", match: :first

    assert_text "Grothendieck sites category was successfully destroyed"
  end
end
