ENV['RAILS_ENV'] ||= 'test'
require 'simplecov'

SimpleCov.start 'rails' do
  SimpleCov.coverage_dir 'public/coverage'
  add_filter '/spec/'
  add_filter '/config/'
  add_filter '/vendor/'
  add_filter '/channels'
  add_filter '/jobs'
  add_filter '/helpers'
  add_group 'Controllers', 'app/controllers'
  add_group 'Models', 'app/models'

  SimpleCov.formatter = SimpleCov::Formatter::HTMLFormatter
end


SimpleCov.at_exit do
  SimpleCov.result.format!
end
