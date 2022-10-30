# frozen_string_literal: true

require 'simplecov'
require 'simplecov-cobertura'

SimpleCov.minimum_coverage 80
SimpleCov.minimum_coverage_by_file 60
SimpleCov.configure do
  formatter SimpleCov::Formatter::MultiFormatter
    .new([SimpleCov::Formatter::HTMLFormatter, SimpleCov::Formatter::CoberturaFormatter])

  coverage_dir(ENV['COVERAGE_REPORTS'] || 'coverage')
  add_group 'Interactions', 'app/interactions'
  add_group 'Serializers', 'app/serializers'
  add_group 'Concerns',    ['app/controllers/concerns', 'app/models/concerns']
  add_group 'Support',     'app/support'
  add_filter ['app/channels', 'app/mailers', 'app/jobs']
  add_filter { |code| code.lines.count < 5 }
end
