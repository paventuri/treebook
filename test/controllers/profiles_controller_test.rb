require 'test_helper'

class ProfilesControllerTest < ActionController::TestCase
  test "should get show" do
    get :show, id: users(:paulo).profile_name
    assert_response :success
    assert_template "profiles/show"
  end

  test "should not get show" do
    get :show, id: "does not exist"
    assert_response :not_found
  end


  test "should have the variables assigned on successfully profile page" do
    get :show, id: users(:paulo).profile_name
    assert assigns(:user)
    assert_not_empty assigns(:statuses)
  end

  test "should only show statuses for the current user" do
    get :show, id: users(:paulo).profile_name
    assigns(:statuses).each do |status|
    	assert_equal users(:paulo).profile_name, status.user.profile_name
    end
  end

end
