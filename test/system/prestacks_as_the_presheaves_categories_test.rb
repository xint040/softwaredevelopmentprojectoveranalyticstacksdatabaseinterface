require "application_system_test_case"

class PrestacksAsThePresheavesCategoriesTest < ApplicationSystemTestCase
  setup do
    @prestacks_as_the_presheaves_category = prestacks_as_the_presheaves_categories(:one)
  end

  test "visiting the index" do
    visit prestacks_as_the_presheaves_categories_url
    assert_selector "h1", text: "Prestacks as the presheaves categories"
  end

  test "should create prestacks as the presheaves category" do
    visit prestacks_as_the_presheaves_categories_url
    click_on "New prestacks as the presheaves category"

    fill_in "Prestacks as the presheaves categories description", with: @prestacks_as_the_presheaves_category.prestacks_as_the_presheaves_categories_description
    fill_in "Prestacks as the presheaves categories target categories", with: @prestacks_as_the_presheaves_category.prestacks_as_the_presheaves_categories_target_categories
    fill_in "Underlying grothendieck sites category", with: @prestacks_as_the_presheaves_category.underlying_grothendieck_sites_category
    click_on "Create Prestacks as the presheaves category"

    assert_text "Prestacks as the presheaves category was successfully created"
    click_on "Back"
  end

  test "should update Prestacks as the presheaves category" do
    visit prestacks_as_the_presheaves_category_url(@prestacks_as_the_presheaves_category)
    click_on "Edit this prestacks as the presheaves category", match: :first

    fill_in "Prestacks as the presheaves categories description", with: @prestacks_as_the_presheaves_category.prestacks_as_the_presheaves_categories_description
    fill_in "Prestacks as the presheaves categories target categories", with: @prestacks_as_the_presheaves_category.prestacks_as_the_presheaves_categories_target_categories
    fill_in "Underlying grothendieck sites category", with: @prestacks_as_the_presheaves_category.underlying_grothendieck_sites_category
    click_on "Update Prestacks as the presheaves category"

    assert_text "Prestacks as the presheaves category was successfully updated"
    click_on "Back"
  end

  test "should destroy Prestacks as the presheaves category" do
    visit prestacks_as_the_presheaves_category_url(@prestacks_as_the_presheaves_category)
    click_on "Destroy this prestacks as the presheaves category", match: :first

    assert_text "Prestacks as the presheaves category was successfully destroyed"
  end
end
