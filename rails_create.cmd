@echo off
REM Create a new rails project %1, install my favorite gems, and call 'bundle install'.
REM Syntax  
REM    at the root of the rails project folder, type: "rails_new_gems <new-project-name>  

cls

REM Create the new rails project
echo Creating new rails project...
call rails new %1

echo Changing into project root and installing my favorite gems...
cd %1

REM add gems to Gem file - you must run the batch file in RAILS_PROJECT_ROOT
echo # gcws - adding my favorite gems >> Gemfile
echo gem 'rails-footnotes' >> Gemfile
echo gem 'google-webfonts-rails', '~^> 0.0.4' >> Gemfile
echo gem 'skeleton-rails', :git =^> 'https://github.com/helios-technologies/skeleton-rails' >> Gemfile
echo gem 'faker' >> Gemfile
echo gem 'hirb' >> Gemfile
echo gem 'awesome_print' >> Gemfile
echo gem 'forgery', '0.6.0' >> Gemfile

call bundle install
call rails g rails_footnotes:install
call rails g skeleton:install

dir /w
