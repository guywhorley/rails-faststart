# Introduction

After spending more that few frustrating hours trying to get Rails, Rspec, Capybara, and Selenium Webriver to play nicely together,
I finally found the sweet spot that is the proverbial big bag of Capybara/Selenium awesome! I am documenting the gems and files I updated to finally make the browser magically work all by itself. (Look ma, no hands' on the keyboard yet I am filling in form fields === BY THE POWER OF MY MIND! Hey ... no one else needs to know that it is actually the selenium webdriver that is powering it all. Or you could put it down to evil spirits trying to inhabit the computer - and the charge a hefty fee to exercise the demons from the computer. Your call.) At any rate, digressions aside...

## Envronment: 
1. Windows 10, 64-bit
2. Ruby  v2.2.4
3. Rails v4.2.6
4. Firefox v46.0.1
5. __[optional] Deschutes Black Butte Porter - 6 pack__ 
6. __[optional] Tim's Cascade Hawaiian Chips (Party Size)__

## Prerequisites
1. Ruby and Rails in a happy place, with big fluffy clouds and cute little critters, ala Bob Ross.
2. A rails project has been created. (__"rails new cujo__")  

### 1.0 Install Gems

The following gems will need to be installed:<br> 

*rspec, rspec-rails, capybara, selenium-webdriver, database_cleaner*

From the command-line: issue the following commands:<br>

gem install rspec<br>
gem install rspec-rails<br>
gem install capybara<br>
gem install selenium-webdriver<br>
gem install database_cleaner<br>
*selenium-webdriver v2.53.3 was the most current at the time of this writing.

### 2.0 Update Gemfile

Edit the Gemfile in the root of your Rails project. <br>
Add the following entries into the __'group :development, :test'__ block:<br>

group :development, :test do<br>
	gem 'rspec'<br>
	gem 'rspec-rails'<br>
	gem 'capybara'<br>
	gem 'selenium-webdriver', '~> 2.53.3'<br>
	gem 'database_cleaner'<br>
end<br>

Save and exit.

### 3.0 Bundle Install and Initialize RSpec 

At the command-line in the root of the rails project, issue the following commands:<br>

*"bundle install"*

Initialize the */spec* directory:<br>

*"rails generate rspec:install"*

### 4.0 Enable Capybara Integration with RSpec

4.1 Update *"spec_helper.rb"* 

In the */spec/spec_helper.rb* file, add the following lines at the top:<br>

require File.expand_path("../../config/environment", __FILE__)<br>
require 'rspec/rails'<br>
require 'capybara/rspec'<br>
require 'capybara/rails'<br>
Capybara.server_port = 57124<br>
Capybara.app_host = "http://localhost:#{Capybara.server_port}"<br>

4.2 Update *"rails_helper.rb"*

Without this update, when running **'rspec spec'** (i.e. the actual test run), rspec did not recognize the capybara **visit** method. By adding this line, rspec was able to recognize the Capybara Domain-Specific Language, thus understanding what **visit** actually meant as in ... go visit my login page **now** please!

Add support for Capybara DSL by adding the following line near the very end of configure block in /spec/rails_helper.rb file:
  RSpec.configure do |config|
  ...
  ...  
    config.include Capybara::DSL
  end
  
### 5.0 "Turn On" Selenium/Firefox in the /spec/features/*_spec.rb files

For any specs requiring Selenium integration (you want a real instance of firefox to launch), place your test code within the /spec/features folder.
Setup the /spec/features/<your-file>_spec.rb as follows:

/spec/features/my_features_spec.rb
require 'rails_helper'

RSpec.describe "<YOUR-DESCRIBE-HERE>", :js => true do  # the :js => true 'turns on capybara selenium'
	
	#example scenarios
	scenario "login page is accessible and has email and password fields" do
		visit "http://localhost:3000/cujo/index"
		expect(page).to have_field('email')
        expect(page).to have_field('password')
	end
	scenario "successfully login" do
        visit "http://localhost:3000/cujo/index"
		# capybara finds by #id, name atribute, or visible text
		fill_in "email", with: "cujo@bigscarydog.edu"
        fill_in "password", with: "I_luv_squirrels"
        click_button "Login" 
        expect(page).to have_content "Logged In"
    end
end 

Capybara Cheat Sheet https://gist.github.com/zhengjia/428105

### 6.0 Run The Tests 

The simplest way to run rspec tests is from the command line by simply typing "rspec ." or "rspec spec" at project root.
See online rspec documentation for the myriad ways that one could run tests.  
 













