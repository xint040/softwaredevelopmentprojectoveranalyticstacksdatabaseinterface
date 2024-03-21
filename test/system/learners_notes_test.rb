require "application_system_test_case"

class LearnersNotesTest < ApplicationSystemTestCase
  setup do
    @learners_note = learners_notes(:one)
  end

  test "visiting the index" do
    visit learners_notes_url
    assert_selector "h1", text: "Learners notes"
  end

  test "should create learners note" do
    visit learners_notes_url
    click_on "New learners note"

    fill_in "Learners notes date", with: @learners_note.learners_notes_date
    fill_in "Learners notes description", with: @learners_note.learners_notes_description
    fill_in "Learners notes more things want to learn on analytic stacks", with: @learners_note.learners_notes_more_things_want_to_learn_on_analytic_stacks
    fill_in "Learners notes text", with: @learners_note.learners_notes_text
    fill_in "Learners notes title", with: @learners_note.learners_notes_title
    click_on "Create Learners note"

    assert_text "Learners note was successfully created"
    click_on "Back"
  end

  test "should update Learners note" do
    visit learners_note_url(@learners_note)
    click_on "Edit this learners note", match: :first

    fill_in "Learners notes date", with: @learners_note.learners_notes_date
    fill_in "Learners notes description", with: @learners_note.learners_notes_description
    fill_in "Learners notes more things want to learn on analytic stacks", with: @learners_note.learners_notes_more_things_want_to_learn_on_analytic_stacks
    fill_in "Learners notes text", with: @learners_note.learners_notes_text
    fill_in "Learners notes title", with: @learners_note.learners_notes_title
    click_on "Update Learners note"

    assert_text "Learners note was successfully updated"
    click_on "Back"
  end

  test "should destroy Learners note" do
    visit learners_note_url(@learners_note)
    click_on "Destroy this learners note", match: :first

    assert_text "Learners note was successfully destroyed"
  end
end
