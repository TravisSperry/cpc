# frozen_string_literal: true

source 'https://rubygems.org'

ruby '2.6.3'

git_source(:github) { |repo| "https://github.com/#{repo}.git" }

gem 'rails', '~> 5.2.1'

gem 'acts_as_paranoid', '~> 0.6.0'
gem 'barby', '~> 0.6.2'
gem 'bootsnap', '>= 1.1.0', require: false
gem 'bootstrap', '~> 4.3.1'
gem 'bootstrap-datepicker-rails'
gem 'bootstrap3-datetimepicker-rails', '~> 4.17.47'
gem 'cancancan'
gem 'carrierwave', github: 'carrierwaveuploader/carrierwave'
gem 'carrierwave-aws'
gem 'chosen-rails'
gem 'chunky_png'
gem 'cocoon'
gem 'coffee-rails'
gem 'devise', '~> 4.7.0'
gem 'enum_help'
gem 'flipper'
gem 'flipper-redis'
gem 'flipper-ui'
gem 'font-awesome-sass', '~> 5.0.6'
gem 'haml-rails', '~> 1.0'
gem 'high_voltage', '~> 3.0.0'
gem 'jquery-datatables-rails'
gem 'jquery-rails'
gem 'jquery-ui-rails'
gem 'json', '~> 2.3.0'
gem 'kaminari', '~> 1.2.1'
gem 'loofah', '>= 2.2.3'
gem 'modernizr-rails'
gem 'momentjs-rails', '>= 2.9.0'
gem 'nokogiri', '>= 1.11.0.rc4'
gem 'paper_trail'
gem 'public_activity'
gem 'puma', '~> 3.12.2'
gem 'rack', '~> 2.1.4'
gem 'recaptcha', require: 'recaptcha/rails'
gem 'rollbar'
gem 'rqrcode'
gem 'rubyzip', '~> 1.3.0'
gem 'sass-rails'
gem 'simple_form', '~> 5.0.0'
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
  gem 'pry-remote'
  gem 'rubocop', '~> 0.60', require: false
  gem 'rubocop-rspec'
  gem 'web-console'
end

group :test do
  gem 'capybara'
  gem 'selenium-webdriver'
end

group :production do
  gem 'pg', '= 0.21'
end
