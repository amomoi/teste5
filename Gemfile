source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.2.2'

gem 'rest-client', '~> 2.1.0'
gem 'net-http'
gem 'uri'
gem 'rails', '~> 7.0.8.7'



# Use postgresql as the database for Active Record
gem 'pg', '~> 1.1' # Única definição da gem 'pg'

# Use Puma como o servidor da aplicação
gem 'puma', '~> 5.0'

# Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker
gem 'webpacker', '~> 5.0'
gem 'sass-rails', '>= 6' # Use SCSS para stylesheets
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.7'

# Reduz o tempo de inicialização via caching
gem 'bootsnap', '>= 1.4.4', require: false

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  gem 'web-console', '>= 4.1.0'
  gem 'rack-mini-profiler', '~> 2.0'
  gem 'listen', '~> 3.3'
  gem 'spring'
end

group :test do
  gem 'capybara', '>= 3.26'
  gem 'selenium-webdriver'
  gem 'webdrivers'
end

group :production do
  
end


gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby] # Para compatibilidade no Windows
