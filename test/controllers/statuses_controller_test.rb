require 'test_helper'

class StatusesControllerTest < ActionController::TestCase
  setup do
    @status = statuses(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:statuses)
  end

  test "should be redirected to login page when not logged in" do
    get :new
    assert_response :redirect
    assert_redirected_to new_user_session_path
  end

  test "should get new when logged in" do
    sign_in users(:paulo)
    get :new
    assert_response :success
  end

  test "should be logged in to post a status" do
    post :create, status: {content: "hello"}
    assert_response :redirect
    assert_redirected_to new_user_session_path
  end

  test "should create status" do
    sign_in users(:paulo)

    assert_difference('Status.count') do
      post :create, status: { content: @status.content}
    end

    assert_redirected_to status_path(assigns(:status))
  end

  test "should show status" do
    get :show, id: @status
    assert_response :success
  end

  test "should be logged in to edit a status" do
    get :edit, id: @status
    assert_response :redirect
    assert_redirected_to new_user_session_path
  end

  test "should get edit" do
    sign_in users(:paulo)
    get :edit, id: @status
    assert_response :success
  end

  test "should be logged in to update a status" do
    get :update, id: @status, status: {content: "hello update"}
    assert_response :redirect
    assert_redirected_to new_user_session_path
  end

  test "should update status" do
    sign_in users(:paulo)
    patch :update, id: @status, status: { content: @status.content}
    assert_redirected_to status_path(assigns(:status))
  end

  test "should destroy status" do
    assert_difference('Status.count', -1) do
      delete :destroy, id: @status
    end

    assert_redirected_to statuses_path
  end
end
