ENV['RAILS_ENV'] ||= 'test'
require 'simplecov'
require 'sidekiq/testing'
require 'knapsack_pro'

knapsack_pro_adapter = KnapsackPro::Adapters::MinitestAdapter.bind
knapsack_pro_adapter.set_test_helper_path(__FILE__)


SimpleCov.start 'rails' do
  SimpleCov.coverage_dir 'public/coverage'
  add_filter '/spec/'
  add_filter '/config/'
  add_filter '/vendor/'
  add_filter '/channels'
  add_filter '/helpers'
  add_group 'Controllers', 'app/controllers'
  add_group 'Models', 'app/models'
  add_group 'Services', 'app/services'

  SimpleCov.formatter = SimpleCov::Formatter::HTMLFormatter
end

SimpleCov.at_exit do
  SimpleCov.result.format!
end
