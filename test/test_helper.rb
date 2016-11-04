ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  def Setup
    #Once you have enabled test mode, all requests to omniAuth will be short circuited to use the mock authentication hash. A request to /ath/provider will redirect immediately to /auth/provider/callback.
    OmniAuth.config.test_mode = true
    #The mock_auth configuration allows you to set per-provider (or default) authentication hashes to return during testing. 
    OmniAuth.config.mock_auth[:github] = OmniAuth::AuthHash.new({provider: 'github', uid: '12345', info: {email: "lovelace@ada.com", name: "Ada"}
    })
  end

end
