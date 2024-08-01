source 'https://rubygems.org'

ruby '3.3.2'

# Rails and core functionality
gem 'rails', '~> 7.1.3', '>= 7.1.3.4'
gem 'importmap-rails'
gem 'sprockets-rails'
gem 'turbo-rails'
gem 'stimulus-rails'
gem 'jbuilder'

# Database and server
gem 'pg', '~> 1.1'
gem 'puma', '>= 5.0'

# Miscellaneous
gem 'bootsnap', require: false
gem 'tzinfo-data', platforms: %i[windows jruby]

# Authentication and pagination
gem 'devise'
gem 'pagy', '~> 9.0'

# Development and test gems
group :development, :test do
  gem 'debug', platforms: %i[mri windows]
end

# Development gems
group :development do
  gem 'web-console'
  gem 'pry'
  gem 'letter_opener'
end

# Test gems
group :test do
  gem 'capybara'
  gem 'selenium-webdriver'
end
