# frozen_string_literal: true

require "view_component/test_helpers"
# require "capybara/rspec"

RSpec.configure do |config|
  config.include ViewComponent::TestHelpers, type: :component
  # config.include Capybara::RSpecMatchers, type: :component
end
