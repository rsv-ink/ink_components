# frozen_string_literal: true

require "view_component/test_helpers"
# require "capybara/rspec"

RSpec.configure do |config|
  %i[component helper].each do |type|
    config.include ViewComponent::TestHelpers, type:
  end
  # config.include Capybara::RSpecMatchers, type: :component
end
