require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

	test "test validity of user if email, uid, and provider not present" do
	  user = User.new
	  assert_not user.valid?
	  user.email = "joe@schmoe.com"
	  assert_not user.valid?
	  user.uid = 12
	  assert_not user.valid?
	  user.provider = "github"
	  assert user.valid?
	end

end
