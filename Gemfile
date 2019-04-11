# frozen_string_literal: true

source 'https://rubygems.org'

ruby '2.5.1'

git_source(:github) { |repo| "https://github.com/#{repo}.git" }

gem 'rails', '~> 5.2.1'

gem 'acts_as_paranoid', '~> 0.6.0'
gem 'bootsnap', '>= 1.1.0', require: false
gem 'bootstrap', '~> 4.0.0'
gem 'bootstrap3-datetimepicker-rails', '~> 4.17.47'
gem 'cancancan'
gem 'carrierwave', github: 'carrierwaveuploader/carrierwave'
gem 'carrierwave-aws'
gem 'chosen-rails'
gem 'cocoon'
gem 'coffee-rails'
gem 'bootstrap-datepicker-rails'
gem 'devise'
gem 'enum_help'
gem 'font-awesome-sass', '~> 5.0.6'
gem 'haml-rails', '~> 2.0'
gem 'high_voltage', '~> 3.0.0'
gem 'jquery-datatables-rails'
gem 'jquery-rails'
gem 'jquery-ui-rails'
gem 'kaminari'
gem "loofah", ">= 2.2.3"
gem 'modernizr-rails'
gem 'momentjs-rails', '>= 2.9.0'
gem 'paper_trail'
gem 'public_activity'
gem 'puma'
gem 'recaptcha', require: 'recaptcha/rails'
gem 'rollbar'
gem 'sass-rails'
gem 'simple_form'
gem 'sitemap_generator'
gem 'tether-rails'
gem 'uglifier', '>= 1.0.3'
gem 'wicked_pdf'
gem 'wkhtmltopdf-binary'

group :development, :test do
  gem 'factory_bot_rails'
  gem 'faker'
  gem 'letter_opener'
  gem 'pry-rails'
  gem 'rspec-junklet'
  gem 'rspec-rails', '~> 3.7'
  gem 'sqlite3'
end

group :development do
  gem 'haml_lint', require: false
  gem 'listen'
  gem 'rubocop', '~> 0.51.0', require: false
  gem 'rubocop-rspec'
  gem 'pry-remote'
  gem 'web-console'
end

group :test do
  gem 'capybara'
  gem 'selenium-webdriver'
end

group :production do
  gem 'pg', '= 0.21'
end
