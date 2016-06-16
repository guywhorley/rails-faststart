@echo off

REM Install my favorite gems, update Gemfile and call 'bundle install'.
REM Usage
REM    at the ROOT-DIRECTORY of the rails project folder, type: "rails_mygems

REM add gems to Gem file
cls
echo ***************************
echo   Adding gems to Gemfile
echo. >> Gemfile
echo # My favorite gems >> Gemfile
echo group :development, :test do >> Gemfile
echo   gem 'rspec' >> Gemfile
echo   gem 'rspec-rails' >> Gemfile
echo   gem 'byebug' >> Gemfile
REM echo   gem 'database_cleaner', '~^> 1.5', '^>= 1.5.3' >> Gemfile
REM echo   gem 'capybara-rails', '~^> 0.0.2' >> Gemfile
REM echo   gem 'capybara' >> Gemfile
echo end >> Gemfile

echo. >> Gemfile
echo # My favorite gems >> Gemfile
echo gem 'rails-footnotes' >> Gemfile
echo gem 'google-webfonts-rails', '~^> 0.0.4' >> Gemfile
echo gem 'skeleton-rails', :git =^> 'https://github.com/helios-technologies/skeleton-rails' >> Gemfile
echo gem 'faker' >> Gemfile
echo gem 'hirb' >> Gemfile
echo gem 'awesome_print' >> Gemfile
echo gem 'forgery', '0.6.0' >> Gemfile
echo. >> Gemfile

REM Have rails gather the necesaary gems
echo   bundle install...
echo ***************************
call bundle install
call rails g rails_footnotes:install
call rails g skeleton:install
call rails g rspec:install

dir /w
