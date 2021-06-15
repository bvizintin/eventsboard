source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.3'

#Rails Default Gems
gem 'rails', '~> 6.1.3', '>= 6.1.3.2'
gem 'sqlite3', '~> 1.4'
gem 'puma', '~> 5.0'
gem 'sass-rails', '>= 6'
gem 'webpacker', '~> 5.0'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.7'
gem 'bootsnap', '>= 1.4.4', require: false

#My Gems
gem 'better_errors', '~> 2.9', '>= 2.9.1'
gem 'awesome_print', '~> 1.9', '>= 1.9.2'
#gem 'bootstrap-sass', '~> 3.4', '>= 3.4.1'
gem 'jquery-rails'
gem 'bootstrap', '~> 5.0', '>= 5.0.1'
gem 'font-awesome-rails', '~> 4.7', '>= 4.7.0.7'
gem 'simple_form', '~> 5.1'
gem 'devise', '~> 4.8'  #for authentication


gem 'friendly_id', '~> 5.4', '>= 5.4.2' #user friendly URL and SEO
gem 'carrierwave', '~> 2.2', '>= 2.2.2' #image and file upload
gem 'mini_magick', '~> 4.11' #isto treba za Carrierwave
gem 'searchkick', '~> 4.5' #Intelligent search made easy
gem 'will_paginate', '~> 3.3'
gem 'bootstrap-will_paginate', '~> 1.0'
gem 'pundit', '~> 2.1' #for authorization
#gem 'fog', '~> 2.2' # cloud service lib, potreban za Carrierwave


group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 4.1.0'
  # Display performance information such as SQL time and flame graphs for each request in your browser.
  # Can be configured to work on production as well see: https://github.com/MiniProfiler/rack-mini-profiler/blob/master/README.md
  gem 'rack-mini-profiler', '~> 2.0'
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '>= 3.26'
  gem 'selenium-webdriver'
  # Easy installation and use of web drivers to run system tests with browsers
  gem 'webdrivers'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
