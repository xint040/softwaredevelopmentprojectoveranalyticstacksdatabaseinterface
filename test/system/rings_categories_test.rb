require "application_system_test_case"

class RingsCategoriesTest < ApplicationSystemTestCase
  setup do
    @rings_category = rings_categories(:one)
  end

  test "visiting the index" do
    visit rings_categories_url
    assert_selector "h1", text: "Rings categories"
  end

  test "should create rings category" do
    visit rings_categories_url
    click_on "New rings category"

    fill_in "Clausen scholze analytic 1 more adic style", with: @rings_category.Clausen_Scholze_analytic_1_more_adic_style
    fill_in "Clausen scholze analytic 2 more categorical flavor", with: @rings_category.Clausen_Scholze_analytic_2_more_categorical_flavor
    fill_in "Adic", with: @rings_category.adic
    fill_in "Condensed", with: @rings_category.condensed
    fill_in "Indbanach", with: @rings_category.indBanach
    fill_in "Indnormed", with: @rings_category.indnormed
    fill_in "Indseminormed", with: @rings_category.indseminormed
    fill_in "Monomorphicindbanach", with: @rings_category.monomorphicindBanach
    fill_in "Monomorphicindnormed", with: @rings_category.monomorphicindnormed
    fill_in "Monomorphicindseminormed", with: @rings_category.monomorphicindseminormed
    fill_in "Perfectoid", with: @rings_category.perfectoid
    fill_in "Rings categories charactaristics", with: @rings_category.rings_categories_charactaristics
    fill_in "Rings categories description", with: @rings_category.rings_categories_description
    fill_in "Topologies on the rings", with: @rings_category.topologies_on_the_rings
    click_on "Create Rings category"

    assert_text "Rings category was successfully created"
    click_on "Back"
  end

  test "should update Rings category" do
    visit rings_category_url(@rings_category)
    click_on "Edit this rings category", match: :first

    fill_in "Clausen scholze analytic 1 more adic style", with: @rings_category.Clausen_Scholze_analytic_1_more_adic_style
    fill_in "Clausen scholze analytic 2 more categorical flavor", with: @rings_category.Clausen_Scholze_analytic_2_more_categorical_flavor
    fill_in "Adic", with: @rings_category.adic
    fill_in "Condensed", with: @rings_category.condensed
    fill_in "Indbanach", with: @rings_category.indBanach
    fill_in "Indnormed", with: @rings_category.indnormed
    fill_in "Indseminormed", with: @rings_category.indseminormed
    fill_in "Monomorphicindbanach", with: @rings_category.monomorphicindBanach
    fill_in "Monomorphicindnormed", with: @rings_category.monomorphicindnormed
    fill_in "Monomorphicindseminormed", with: @rings_category.monomorphicindseminormed
    fill_in "Perfectoid", with: @rings_category.perfectoid
    fill_in "Rings categories charactaristics", with: @rings_category.rings_categories_charactaristics
    fill_in "Rings categories description", with: @rings_category.rings_categories_description
    fill_in "Topologies on the rings", with: @rings_category.topologies_on_the_rings
    click_on "Update Rings category"

    assert_text "Rings category was successfully updated"
    click_on "Back"
  end

  test "should destroy Rings category" do
    visit rings_category_url(@rings_category)
    click_on "Destroy this rings category", match: :first

    assert_text "Rings category was successfully destroyed"
  end
end
