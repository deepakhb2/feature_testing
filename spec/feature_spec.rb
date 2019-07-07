require "app"
require 'capybara/dsl'
require 'capybara/poltergeist'

Capybara.default_driver = :poltergeist
Capybara.app = proc { |env| App.new.call(env) }

RSpec.configure do |config|
  config.include Capybara::DSL
end
