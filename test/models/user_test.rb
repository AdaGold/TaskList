require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  
  test "users should return their associated attributes" do
    assert_equal "11234", users(:ada).uid
    assert_equal "github", users(:ada).provider
    assert_equal "ada@ada.com", users(:ada).email
    assert_equal "1", users(:ada).id
    assert_equal "Ada Lovelace", users(:ada).name
  end

  test "users without a unique email, uid and profile_name are invalid" do
    user = User.new(profile_name: "Barbara Bomb", email: "bab@ada.com", uid: "54321", provider: "github")
    assert_equal false, user.valid?
  end

  test "users must have a uid, email and provider to be valid" do
    assert_not user(:bob).valid?
    user(:bob).uid = nill
    assert_not user(:babbage).valid?
    user(:bob).provider = nill
    assert_not user(:babbage).valid?
  end

end
