# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.3'

gem 'action_policy'
gem 'bootsnap', '>= 1.4.4', require: false
gem 'devise'
gem 'dry-initializer'
gem 'dry-monads'
gem 'dry-validation'
gem 'jbuilder', '~> 2.7'
gem 'pg', '~> 1.1'
gem 'puma', '~> 5.0'
gem 'rails', '~> 6.1.4'
gem 'react-rails'
gem 'rswag'
gem 'sass-rails', '>= 6'
gem 'turbolinks', '~> 5'
gem 'webpacker', '~> 5.0'

group :development, :test do
  gem 'brakeman'
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'database_consistency'
  gem 'haml-lint', require: false
  gem 'ordinare', require: false
  gem 'pry'
  gem 'pry-byebug'
  gem 'pry-rails'
  gem 'railroady'
  gem 'reek', require: false
  gem 'rspec-rails', '~> 5.0.0'
  gem 'rswag-specs'
  gem 'rubocop', require: false
  gem 'rubocop-performance', require: false
  gem 'rubocop-rails', require: false
  gem 'rubocop-rspec', require: false
  gem "factory_bot_rails"
  gem 'solargraph'
  gem 'traceroute'
end

group :development do
  gem 'annotate'
  gem 'listen', '~> 3.3'
  gem 'rack-mini-profiler', '~> 2.0'
  gem 'spring'
  gem 'web-console', '>= 4.1.0'
end

gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

gem 'aasm'
