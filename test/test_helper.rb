require 'rails/test_help'
require "minitest/reporters"
Minitest::Reporters.use!

ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)


class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all
  def setup
    # Turn on test mode - auth requests will be short-circuited
    OmniAuth.config.test_mode = true
    # What data should we get back from auth requests?
    OmniAuth.config.mock_auth[:github] = OmniAuth::AuthHash.new({
      provider: 'github', uid: '99999', info: { email: "a@b.com", name: "Ada" }
      })
  end


end
