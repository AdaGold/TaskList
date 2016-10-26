require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "the truth" do
    assert true
  end

  test "An User must have an email, provider, and uid" do
    assert users(:ada).valid? "User should be valid if they have an email, provider, and uid"
    assert_not users(:no_uid).valid? "User should be invalid if they don't have a uid"

  end

  test "An Newly created User must have an email, provider, and uid" do
    user = User.new
    assert_not user.valid? "An Artist without a name is invalid."

    user.email = "name@gmail.com"
    user.uid = "321"
    user.provider = "github"
    assert user.valid?
  end

  test "Returns the correct number of tasks for a user" do
    assert_equal users(:ada).tasks.length,  1
    assert_not_equal users(:babbage).tasks.length,  2 # because there is actually 1
  end

  test "An user contains the correct tasks" do
    assert_includes users(:ada).tasks,  tasks(:adas_task)
    assert_not_includes users(:babbage).tasks,  tasks(:adas_task)
  end

end
