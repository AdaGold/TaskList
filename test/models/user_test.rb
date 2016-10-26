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

  # test "Returns the correct number of albums for an artist" do
  #   assert_equal artists(:bonjovi).albums.length,  2
  #   assert_not_equal artists(:beyonce).albums.length,  1 # because there are actually 0
  # end

  # test "An artist contains the correct albums" do
  #   assert_includes artists(:bonjovi).albums,  albums(:slippery_when_wet)
  #   assert_not_includes artists(:bonjovi).albums,  albums(:the_getaway)
  #
  # end

end
