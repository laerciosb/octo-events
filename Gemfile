# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.1.2'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails', branch: 'main'
gem 'rails', '~> 7.0.4'
# Use postgresql as the database for Active Record
gem 'pg', '~> 1.4'
# Use the Puma web server [https://github.com/puma/puma]
gem 'puma', '~> 5.0'
# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', require: false
# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

# For App Support

# ActiveInteraction manages application-specific business logic. It's an implementation of the command pattern in Ruby
gem 'active_interaction'
# The ultimate pagination ruby gem
gem 'pagy'
# A fast JSON:API serializer for Ruby Objects
gem 'jsonapi-serializer'
# Coercion and validation for data structures
gem 'dry-schema'

# For Basic Protection

# Rack middleware for blocking & throttling abusive requests
gem 'rack-attack'
# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
# gem 'rack-cors'

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem 'debug', platforms: %i[mri mingw x64_mingw]

  # Ruby library that pretty prints Ruby objects in full color exposing
  gem 'amazing_print'
  # help to kill N+1 queries and unused eager loading
  gem 'bullet'
  # Use Factory Bot to create objects dynamically
  gem 'factory_bot_rails'
  # Use RSpec to execute specs suite
  gem 'rspec-rails'
  # Shim to load environment variables from .env into ENV in development.
  gem 'dotenv-rails'
end

group :development do
  # Speed up commands on slow machines / big apps [https://github.com/rails/spring]
  # gem "spring"

  # Add a comment summarizing the current schema to the top or bottom of each of your
  gem 'annotate'
  # A static analysis security vulnerability scanner for Ruby on Rails applications
  gem 'brakeman', require: false
  # Fasterer will suggest some speed improvements
  gem 'fasterer', require: false
  # A code metric tool for rails projects http://rails-bestpractices.com
  gem 'rails_best_practices', require: false
  # RuboCop is a Ruby static code analyzer
  gem 'rubocop', require: false
  # An extension of RuboCop focused on code performance checks
  gem 'rubocop-performance'
  # A RuboCop extension focused on enforcing Rails best practices and coding conventions.
  gem 'rubocop-rails', require: false
  # RubyCritic is a gem that wraps around static analysis
  gem 'rubycritic', require: false
end

group :test do
  # Use for test coverage
  gem 'simplecov', require: false
  # Ruby SimpleCov Cobertura Formatter
  gem 'simplecov-cobertura', require: false
  # RSpec results that your CI can read
  gem 'rspec_junit_formatter'
  # Code style checking for RSpec files
  gem 'rubocop-rspec', require: false
  # Collection of testing matchers
  gem 'shoulda-matchers'
end
