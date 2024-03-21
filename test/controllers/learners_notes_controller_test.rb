require "test_helper"

class LearnersNotesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @learners_note = learners_notes(:one)
  end

  test "should get index" do
    get learners_notes_url
    assert_response :success
  end

  test "should get new" do
    get new_learners_note_url
    assert_response :success
  end

  test "should create learners_note" do
    assert_difference("LearnersNote.count") do
      post learners_notes_url, params: { learners_note: { learners_notes_date: @learners_note.learners_notes_date, learners_notes_description: @learners_note.learners_notes_description, learners_notes_more_things_want_to_learn_on_analytic_stacks: @learners_note.learners_notes_more_things_want_to_learn_on_analytic_stacks, learners_notes_text: @learners_note.learners_notes_text, learners_notes_title: @learners_note.learners_notes_title } }
    end

    assert_redirected_to learners_note_url(LearnersNote.last)
  end

  test "should show learners_note" do
    get learners_note_url(@learners_note)
    assert_response :success
  end

  test "should get edit" do
    get edit_learners_note_url(@learners_note)
    assert_response :success
  end

  test "should update learners_note" do
    patch learners_note_url(@learners_note), params: { learners_note: { learners_notes_date: @learners_note.learners_notes_date, learners_notes_description: @learners_note.learners_notes_description, learners_notes_more_things_want_to_learn_on_analytic_stacks: @learners_note.learners_notes_more_things_want_to_learn_on_analytic_stacks, learners_notes_text: @learners_note.learners_notes_text, learners_notes_title: @learners_note.learners_notes_title } }
    assert_redirected_to learners_note_url(@learners_note)
  end

  test "should destroy learners_note" do
    assert_difference("LearnersNote.count", -1) do
      delete learners_note_url(@learners_note)
    end

    assert_redirected_to learners_notes_url
  end
end
