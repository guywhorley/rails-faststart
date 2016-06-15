# Rails Project Creation Helper

# Overview

The rails_create.cmd file automates commonly-performed tasks during Ruby on Rails project creation.<br>

1. <q>rails new %1</q> is issued, creating a new rails project.<br>
2. The project's Gemfile is appended with the names of your favorite gems.<br>
3. <q>bundle install</q> is issued.<br>
4. Any custom 'rails g ...' commands are issued to finalize gem installs. This will depend on the gems
that are included.<br>

## Syntax

From the directory immediately above where you want the new rails project to be installed,
issue the command: <br>

<q>rails_create NAME_OF_YOUR_PROJECT</q>

*Example*

To create a new rails project called Widgets in the c:/sw/rails_projects directory:
1. From the command line, navigate to c:/sw/rails_projects
2. Issue the command: <q>rails_create Widget</q>

## Caveats

1. Any gems that are listed in the file must have already been installed on your system via 'gem install ....'. Of course, you could include the gem install commands as part of this bat file.
2. If the gem definition in Gem file requires the > character, that character must be escaped with the ^ charactger (Windows-OS specific). See lines 18, 19 in the rails_create.cmd for an example of this.<br>

    gem 'google-webfonts-rails', '~^> 0.0.4' >> Gemfile
