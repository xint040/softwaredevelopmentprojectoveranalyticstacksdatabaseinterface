require "test_helper"

class LearnersDiscussionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @learners_discussion = learners_discussions(:one)
  end

  test "should get index" do
    get learners_discussions_url
    assert_response :success
  end

  test "should get new" do
    get new_learners_discussion_url
    assert_response :success
  end

  test "should create learners_discussion" do
    assert_difference("LearnersDiscussion.count") do
      post learners_discussions_url, params: { learners_discussion: { learners_discussions_date: @learners_discussion.learners_discussions_date, learners_discussions_references: @learners_discussion.learners_discussions_references, learners_discussions_text: @learners_discussion.learners_discussions_text } }
    end

    assert_redirected_to learners_discussion_url(LearnersDiscussion.last)
  end

  test "should show learners_discussion" do
    get learners_discussion_url(@learners_discussion)
    assert_response :success
  end

  test "should get edit" do
    get edit_learners_discussion_url(@learners_discussion)
    assert_response :success
  end

  test "should update learners_discussion" do
    patch learners_discussion_url(@learners_discussion), params: { learners_discussion: { learners_discussions_date: @learners_discussion.learners_discussions_date, learners_discussions_references: @learners_discussion.learners_discussions_references, learners_discussions_text: @learners_discussion.learners_discussions_text } }
    assert_redirected_to learners_discussion_url(@learners_discussion)
  end

  test "should destroy learners_discussion" do
    assert_difference("LearnersDiscussion.count", -1) do
      delete learners_discussion_url(@learners_discussion)
    end

    assert_redirected_to learners_discussions_url
  end
end
