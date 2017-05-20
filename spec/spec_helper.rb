ENV['RACK_ENV'] = "test"
require "pry"
require 'sinatra'
require "sinatra/base"
require 'rack/test'
require 'database_cleaner'

Dir[File.join(File.dirname(__FILE__), "../app/**/*.rb")].each { |f| require f }

RSpec.configure do |config|
  config.shared_context_metadata_behavior = :apply_to_host_groups
  config.disable_monkey_patching!
  config.profile_examples = 10
  config.order = :random
  config.include Rack::Test::Methods

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  if config.files_to_run.one?
    config.default_formatter = "doc"
  end

  config.before(:suite) do
    DatabaseCleaner.clean_with(:truncation)
  end

  config.before(:each) do
    DatabaseCleaner.strategy = :transaction
  end

  config.before(:each, :js => true) do
    DatabaseCleaner.strategy = :truncation
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end
end
