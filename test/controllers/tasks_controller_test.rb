require 'test_helper'

class TasksControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get show" do
    session[:user_id] = users(:ada).id
    get :show, {id: tasks(:adas_task).id}
    assert_response :success
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should get edit" do
    session[:user_id] = users(:ada).id
    get :edit, {id: tasks(:adas_task).id}
    assert_response :success
  end

  test "should get update" do
    post_params = {id: tasks(:adas_task).id, task: {title: "Testing"}}  # "making a local variabel to control the parameters"
    put :update, post_params
    # put :update, {id: tasks(:adas_task).id}
    assert_response :redirect
  end

  test "should get destroy" do
    delete :destroy, {id: tasks(:adas_task).id}
    assert_response :redirect
  end

  ########## Added new below ###########

  test "Make sure a user can see their tasks" do
    session[:user_id] = users(:ada).id
    get :show, id: tasks(:adas_task).id

    assert_response :success
  end

  test "Make sure a user cannot see another user's tasks" do
    session[:user_id] = users(:babbage).id
    get :show, id: tasks(:adas_task).id

    assert_response :redirect
    assert_equal flash[:notice], "Sorry, you do not have access to that task."
  end

end
