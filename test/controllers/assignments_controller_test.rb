require "test_helper"

class AssignmentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @assignment = assignments(:one)
  end

 

  test "should create assignment" do
    assert_difference("Assignment.count") do
      post assignments_url, params: { assignment: { description: @assignment.description, form_id: @assignment.form_id, user_id: @assignment.user_id } }, as: :json
    end

    assert_response :created
  end

  test "should show assignment" do
    get assignment_url(@assignment), as: :json
    assert_response :success
  end

  

  test "should destroy assignment" do
    assert_difference("Assignment.count", -1) do
      delete assignment_url(@assignment), as: :json
    end

    assert_response :no_content
  end
end
