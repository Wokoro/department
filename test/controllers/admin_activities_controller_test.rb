require 'test_helper'

class AdminActivitiesControllerTest < ActionDispatch::IntegrationTest
  test "should get course" do
    get admin_activities_course_url
    assert_response :success
  end

  test "should get lecturer" do
    get admin_activities_lecturer_url
    assert_response :success
  end

  test "should get student" do
    get admin_activities_student_url
    assert_response :success
  end

  test "should get session_activities" do
    get admin_activities_session_activities_url
    assert_response :success
  end

end
