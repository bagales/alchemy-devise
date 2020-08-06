# frozen_string_literal: true

require_relative './spec_helper'

# Configure Rails Environment
ENV['RAILS_ENV'] ||= 'test'

require File.expand_path('dummy/config/environment.rb', __dir__)
require 'rails-controller-testing'
require 'rspec/rails'
require 'rspec/active_model/mocks'
require 'capybara/rails'
require 'factory_bot'
require 'alchemy/test_support/integration_helpers'
require 'alchemy/devise/test_support/factories'

ActionMailer::Base.delivery_method = :test
ActionMailer::Base.perform_deliveries = true
ActionMailer::Base.default_url_options[:host] = 'test.com'
Capybara.default_driver = :rack_test
Capybara.default_selector = :css
Capybara.ignore_hidden_elements = false
ActiveJob::Base.queue_adapter = :test

ActiveSupport::Deprecation.silenced = true

RSpec.configure do |config|
  config.infer_spec_type_from_file_location!
  config.use_transactional_fixtures = true
  config.include Devise::TestHelpers, type: :controller
  config.include Alchemy::Engine.routes.url_helpers
  config.include FactoryBot::Syntax::Methods
  config.include ActiveJob::TestHelper
  %i[controller feature request].each do |type|
    config.include Alchemy::TestSupport::IntegrationHelpers, type: type
  end
end
