source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '~> 5.1.6'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 3.7'
gem 'sass-rails', '~> 5.0'
gem 'materialize-sass', '~> 1.0.0.rc2'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
gem 'bcrypt', '~> 3.1.7'
gem 'erb2haml'
gem 'haml-rails'
gem 'jquery-rails', '~> 4.3.3'

# Translation
gem 'rails-i18n', '~> 5.1.1'
gem 'enum_help'

# User and Group authentication
gem 'devise', '~> 4.2'
gem 'devise_invitable', '~> 1.7.0'

gem 'webpacker', '~> 3.0'
gem 'gon', '~> 6.2'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :test do
  gem 'capybara', '~> 2.15.4'
  gem 'selenium-webdriver'
  gem 'poltergeist', '~> 1.15.0'
  gem 'launchy', '~> 2.4.3'
  gem 'rspec-rails'
  gem 'factory_bot_rails'
  gem 'rails-controller-testing'
  gem 'database_cleaner'
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'pry-doc'
  gem 'pry-rails'
  gem 'pry-byebug'
  gem 'pry-stack_explorer'
  gem 'annotate'
  gem 'rails-erd'
  gem 'bullet'
  gem 'rack-mini-profiler'
  # gem 'letter_opener'
  gem 'letter_opener_web'
  gem 'spring-commands-rspec'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
