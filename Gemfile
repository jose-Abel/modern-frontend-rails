source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.1.2"

gem "activerecord-postgres_enum"
gem "awesome_print"
gem "bootsnap", require: false
gem "cssbundling-rails"
gem "date_by_example"
gem "devise"
gem "jbuilder"
gem "jsbundling-rails"
gem "kredis"
gem "pg", "~> 1.1"
gem "propshaft"
gem "puma", "~> 5.0"
gem "rails", "~> 7.0.0"
gem "redis", "~> 4.0"
gem "simple_form"
gem "simple_form-tailwind"
gem "stimulus-rails"
gem "table_print"
gem "turbo-rails"
gem "tzinfo-data", platforms: %i[mingw mswin x64_mingw jruby]

group :development, :test do
  gem "cypress-rails"
  gem "debug", platforms: %i[ mri mingw x64_mingw ]
  gem "dotenv-rails"
  gem "faker"
  gem "pry-rails"
  gem "pry-rescue"
  gem "rspec-rails"
  gem "standard"
  gem "test-prof"
end

group :development do
  gem "annotate"
  gem "erb_lint", require: false
  gem "htmlbeautifier"
  gem "listen"
  gem "rack-mini-profiler"
  gem "web-console"
end

group :test do
  gem "capybara"
  gem "capybara-screenshot"
  gem "factory_bot_rails"
  gem "selenium-webdriver"
end
