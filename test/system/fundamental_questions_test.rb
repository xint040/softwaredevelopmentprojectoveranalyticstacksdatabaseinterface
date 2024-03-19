require "application_system_test_case"

class FundamentalQuestionsTest < ApplicationSystemTestCase
  setup do
    @fundamental_question = fundamental_questions(:one)
  end

  test "visiting the index" do
    visit fundamental_questions_url
    assert_selector "h1", text: "Fundamental questions"
  end

  test "should create fundamental question" do
    visit fundamental_questions_url
    click_on "New fundamental question"

    fill_in "Fundamental questions proposing author", with: @fundamental_question.fundamental_questions_proposing_author
    fill_in "Fundamental questions proposing date", with: @fundamental_question.fundamental_questions_proposing_date
    fill_in "Fundamental questions proposing references", with: @fundamental_question.fundamental_questions_proposing_references
    fill_in "Fundamental questions proposing text", with: @fundamental_question.fundamental_questions_proposing_text
    click_on "Create Fundamental question"

    assert_text "Fundamental question was successfully created"
    click_on "Back"
  end

  test "should update Fundamental question" do
    visit fundamental_question_url(@fundamental_question)
    click_on "Edit this fundamental question", match: :first

    fill_in "Fundamental questions proposing author", with: @fundamental_question.fundamental_questions_proposing_author
    fill_in "Fundamental questions proposing date", with: @fundamental_question.fundamental_questions_proposing_date
    fill_in "Fundamental questions proposing references", with: @fundamental_question.fundamental_questions_proposing_references
    fill_in "Fundamental questions proposing text", with: @fundamental_question.fundamental_questions_proposing_text
    click_on "Update Fundamental question"

    assert_text "Fundamental question was successfully updated"
    click_on "Back"
  end

  test "should destroy Fundamental question" do
    visit fundamental_question_url(@fundamental_question)
    click_on "Destroy this fundamental question", match: :first

    assert_text "Fundamental question was successfully destroyed"
  end
end
