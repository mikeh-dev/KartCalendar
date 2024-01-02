source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.1.2"
gem "rails", "~> 7.0.7", ">= 7.0.7.2"
gem "sprockets-rails"
gem "pg", "~> 1.2"
gem "puma", "~> 5.0"
gem "turbo-rails"
gem "stimulus-rails"
gem "jbuilder"
gem "redis", "~> 4.0"
gem "railsui", github: "getrailsui/railsui"
gem "devise"
gem "name_of_person"
gem "meta-tags"
gem "httparty"
gem 'bundler-audit', require: false

gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]
gem "bootsnap", require: false
gem "image_processing", "~> 1.2"

group :development, :test do
  gem "debug", platforms: %i[ mri mingw x64_mingw ]
  gem 'dotenv-rails'
  gem 'erb_lint'
end

group :development do
  gem "web-console"
end

group :test do
  gem "rspec-rails", "~> 5.0.0"
  gem "capybara"
  gem "selenium-webdriver"
  gem "webdrivers"
  gem "factory_bot_rails"
  gem "faker"
  gem "shoulda-matchers"
  gem 'launchy'
  gem 'letter_opener'
end