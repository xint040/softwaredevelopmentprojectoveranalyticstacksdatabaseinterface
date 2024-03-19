require "application_system_test_case"

class StacksAsTheSheavesCategoriesTest < ApplicationSystemTestCase
  setup do
    @stacks_as_the_sheaves_category = stacks_as_the_sheaves_categories(:one)
  end

  test "visiting the index" do
    visit stacks_as_the_sheaves_categories_url
    assert_selector "h1", text: "Stacks as the sheaves categories"
  end

  test "should create stacks as the sheaves category" do
    visit stacks_as_the_sheaves_categories_url
    click_on "New stacks as the sheaves category"

    fill_in "Sheafification from the prestacks as the presheaves category", with: @stacks_as_the_sheaves_category.sheafification_from_the_prestacks_as_the_presheaves_category
    fill_in "Stacks as the sheaves categories description", with: @stacks_as_the_sheaves_category.stacks_as_the_sheaves_categories_description
    fill_in "Stacks as the sheaves categories over topologies can be realized", with: @stacks_as_the_sheaves_category.stacks_as_the_sheaves_categories_over_topologies_can_be_realized
    fill_in "Stacks as the sheaves categories target categories", with: @stacks_as_the_sheaves_category.stacks_as_the_sheaves_categories_target_categories
    click_on "Create Stacks as the sheaves category"

    assert_text "Stacks as the sheaves category was successfully created"
    click_on "Back"
  end

  test "should update Stacks as the sheaves category" do
    visit stacks_as_the_sheaves_category_url(@stacks_as_the_sheaves_category)
    click_on "Edit this stacks as the sheaves category", match: :first

    fill_in "Sheafification from the prestacks as the presheaves category", with: @stacks_as_the_sheaves_category.sheafification_from_the_prestacks_as_the_presheaves_category
    fill_in "Stacks as the sheaves categories description", with: @stacks_as_the_sheaves_category.stacks_as_the_sheaves_categories_description
    fill_in "Stacks as the sheaves categories over topologies can be realized", with: @stacks_as_the_sheaves_category.stacks_as_the_sheaves_categories_over_topologies_can_be_realized
    fill_in "Stacks as the sheaves categories target categories", with: @stacks_as_the_sheaves_category.stacks_as_the_sheaves_categories_target_categories
    click_on "Update Stacks as the sheaves category"

    assert_text "Stacks as the sheaves category was successfully updated"
    click_on "Back"
  end

  test "should destroy Stacks as the sheaves category" do
    visit stacks_as_the_sheaves_category_url(@stacks_as_the_sheaves_category)
    click_on "Destroy this stacks as the sheaves category", match: :first

    assert_text "Stacks as the sheaves category was successfully destroyed"
  end
end
