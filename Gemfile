source "https://rubygems.org"

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem "rails", "~> 5.1.4"
gem "sqlite3"
gem "puma", "~> 3.7"
gem "sass-rails", "~> 5.0"
gem "uglifier", ">= 1.3.0"
gem "config"
gem "coffee-rails", "~> 4.2"
gem "turbolinks", "~> 5"
gem "jquery-rails"
gem "jbuilder", "~> 2.5"
gem "bcrypt", "~> 3.1.7"
gem "bootstrap-sass", "3.3.7"
gem "faker"
gem "carrierwave",             "1.1.0"
gem "mini_magick",             "4.7.0"
gem "fog",                     "1.40.0"
gem "will_paginate", "3.1.5"
gem "bootstrap-will_paginate", "1.0.0"
group :production do
  gem "pg", "0.20.0"
end

group :development, :test do
  gem "byebug", platforms: [:mri, :mingw, :x64_mingw]
  gem "capybara", "~> 2.13"
  gem "selenium-webdriver"
end

group :test do
  gem "minitest-reporters"
  gem "rails-controller-testing"
end

group :development do
  gem "web-console", ">= 3.3.0"
  gem "listen", ">= 3.0.5", "< 3.2"
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
end

gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]
