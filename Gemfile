# frozen_string_literal: true

source 'https://rubygems.org'

alchemy_branch = ENV.fetch('ALCHEMY_BRANCH', 'master')
gem 'alchemy_cms', github: 'AlchemyCMS/alchemy_cms', branch: alchemy_branch

# Specify your gem's dependencies in alchemy-solidus.gemspec
gemspec

group :test do
  gem 'codeclimate-test-reporter', '~> 1.0', require: false if ENV['TRAVIS']
  gem 'mysql2' if ENV['DB'] == 'mysql'
  gem 'pg', '~> 1.0' if ENV['DB'] == 'postgresql'
  gem 'sqlite3' if ENV['DB'].nil? || ENV['DB'] == 'sqlite'
end
