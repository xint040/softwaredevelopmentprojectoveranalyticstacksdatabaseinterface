require "application_system_test_case"

class LearnersDiscussionsTest < ApplicationSystemTestCase
  setup do
    @learners_discussion = learners_discussions(:one)
  end

  test "visiting the index" do
    visit learners_discussions_url
    assert_selector "h1", text: "Learners discussions"
  end

  test "should create learners discussion" do
    visit learners_discussions_url
    click_on "New learners discussion"

    fill_in "Learners discussions date", with: @learners_discussion.learners_discussions_date
    fill_in "Learners discussions references", with: @learners_discussion.learners_discussions_references
    fill_in "Learners discussions text", with: @learners_discussion.learners_discussions_text
    click_on "Create Learners discussion"

    assert_text "Learners discussion was successfully created"
    click_on "Back"
  end

  test "should update Learners discussion" do
    visit learners_discussion_url(@learners_discussion)
    click_on "Edit this learners discussion", match: :first

    fill_in "Learners discussions date", with: @learners_discussion.learners_discussions_date
    fill_in "Learners discussions references", with: @learners_discussion.learners_discussions_references
    fill_in "Learners discussions text", with: @learners_discussion.learners_discussions_text
    click_on "Update Learners discussion"

    assert_text "Learners discussion was successfully updated"
    click_on "Back"
  end

  test "should destroy Learners discussion" do
    visit learners_discussion_url(@learners_discussion)
    click_on "Destroy this learners discussion", match: :first

    assert_text "Learners discussion was successfully destroyed"
  end
end
