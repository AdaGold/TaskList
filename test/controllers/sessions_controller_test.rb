require 'test_helper'

class SessionsControllerTest < ActionController::TestCase
  test "should get create" do
    get :create
    assert_response :success
  end

  test "should get destroy" do
    get :destroy
    assert_response :success
  end

  ################ ADDED ##################
  test "The truth" do
    assert true
  end

  def login_a_user
    request.env['omniauth.auth'] = OmniAuth.config.mock_auth[:github]
    get :create,  {provider: "github"}
  end

  test "Can Create a user" do
    assert_difference('User.count', 1) do
      login_a_user
      assert_response :redirect
      assert_redirected_to root_path
      assert_equal session[:user_id] = User.find_by(uid: OmniAuth.config_mock_provider: "githib").id

    end
  end

  test "If a user logs in twice it doesn't create a 2nd user" do
    assert_difference('User.count', 1) do
      login_a_user
    end
    assert_no_difference('User.count') do
      login_a_user
      assert_response :redirect
      assert_redirected_to root_path
    end
  end

end
