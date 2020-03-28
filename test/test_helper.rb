require 'simplecov'
require 'knapsack_pro'

SimpleCov.start 'rails' do
  filters.clear # This will remove the :root_filter and :bundler_filter that come via simplecov's defaults
  add_filter '/vendor/'
  add_filter '/config/'
  add_filter 'app/channels'
  add_filter 'app/helpers'
  add_filter 'app/controllers/coverages_controller.rb'
  add_group 'Controllers', 'app/controllers'
  add_group 'Models', 'app/models'
  add_group 'Services', 'app/services'
end
SimpleCov.root("public")
ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
#require 'sidekiq/testing'
require 'rails/test_help'

knapsack_pro_adapter = KnapsackPro::Adapters::MinitestAdapter.bind
knapsack_pro_adapter.set_test_helper_path(__FILE__)
