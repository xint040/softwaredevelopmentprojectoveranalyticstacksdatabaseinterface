require "test_helper"

class FundamentalQuestionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @fundamental_question = fundamental_questions(:one)
  end

  test "should get index" do
    get fundamental_questions_url
    assert_response :success
  end

  test "should get new" do
    get new_fundamental_question_url
    assert_response :success
  end

  test "should create fundamental_question" do
    assert_difference("FundamentalQuestion.count") do
      post fundamental_questions_url, params: { fundamental_question: { fundamental_questions_proposing_author: @fundamental_question.fundamental_questions_proposing_author, fundamental_questions_proposing_date: @fundamental_question.fundamental_questions_proposing_date, fundamental_questions_proposing_references: @fundamental_question.fundamental_questions_proposing_references, fundamental_questions_proposing_text: @fundamental_question.fundamental_questions_proposing_text } }
    end

    assert_redirected_to fundamental_question_url(FundamentalQuestion.last)
  end

  test "should show fundamental_question" do
    get fundamental_question_url(@fundamental_question)
    assert_response :success
  end

  test "should get edit" do
    get edit_fundamental_question_url(@fundamental_question)
    assert_response :success
  end

  test "should update fundamental_question" do
    patch fundamental_question_url(@fundamental_question), params: { fundamental_question: { fundamental_questions_proposing_author: @fundamental_question.fundamental_questions_proposing_author, fundamental_questions_proposing_date: @fundamental_question.fundamental_questions_proposing_date, fundamental_questions_proposing_references: @fundamental_question.fundamental_questions_proposing_references, fundamental_questions_proposing_text: @fundamental_question.fundamental_questions_proposing_text } }
    assert_redirected_to fundamental_question_url(@fundamental_question)
  end

  test "should destroy fundamental_question" do
    assert_difference("FundamentalQuestion.count", -1) do
      delete fundamental_question_url(@fundamental_question)
    end

    assert_redirected_to fundamental_questions_url
  end
end
