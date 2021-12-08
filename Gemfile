source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.4'
gem 'rails', '~> 6.1.4'
gem 'faker'

gem 'aws-sdk-rails'
gem "aws-sdk-s3", require: false

gem 'pg'
gem 'factory_bot_rails'
gem 'puma', '~> 5.0'
gem 'sass-rails', '>= 6'
gem 'slim-rails'
gem 'rails-controller-testing'
gem 'webpacker', '~> 5.0'
gem 'meta-tags'

gem 'devise'
gem 'omniauth'
gem 'omniauth-google-oauth2'
gem 'omniauth-rails_csrf_protection'

gem 'premailer-rails'
gem 'bootstrap-email'
gem 'nokogiri'

gem 'ckeditor'

gem 'rubyzip'
gem 'sidekiq'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.7'

gem 'carrierwave-aws'
gem 'carrierwave'
gem 'mini_magick'

gem 'bootsnap', '>= 1.4.4', require: false
gem 'simple_form'

group :development, :test do
  gem 'dotenv-rails'
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'rspec-rails'
  # gem 'factory_bot_rails'
end

group :development do
  gem 'web-console', '>= 4.1.0'
  gem 'rack-mini-profiler', '~> 2.0'
  gem 'listen', '~> 3.3'
  gem 'spring'
end

group :test do
  gem 'capybara', '>= 3.26'
  gem 'shoulda-matchers', '~> 3.0', require: false
  gem 'selenium-webdriver'
  gem 'webdrivers'
  gem 'simplecov', require: false
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
