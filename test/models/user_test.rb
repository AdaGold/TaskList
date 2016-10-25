require 'test_helper'

class UserTest < ActiveSupport::TestCase

  test "users with an email are valid" do
    user = users(:grace)
    assert user.valid?
  end

  test "users without an email are not valid" do
    user = users(:no_email)
    assert_not user.valid?
  end

  test "users with a uid are valid" do
    current_user = users(:ada)
    assert current_user.valid?
  end

  test "users without a uid are not valid" do
    current_user = users(:no_uid)
    assert_not current_user.valid?
  end

  test "users with a provider are valid" do
    this_user = users(:ada)
    assert this_user.valid?
  end

  test "users without a provider are not valid" do
    this_user = users(:no_provider)
    assert_not this_user.valid?
  end
end
