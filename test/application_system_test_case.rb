require 'test_helper'
require 'integration_helper'

# Set systemtest behavior
class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  include IntegrationHelper
  include OmniauthMocker

  before { Capybara.reset_sessions! }

  Capybara.always_include_port = true
  # if in CI, run system tests headlessly.
  # browser = ENV['GITHUB_WORKFLOW'] ? :headless_chrome : :chrome
  browser = :headless_chrome
  opts = { url: "http://myapp-selenium:4444/wd/hub" }
  driven_by :selenium, using: browser, options: opts
end
