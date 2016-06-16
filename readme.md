# Rails Project Creation Helper

## Overview

The rails_faststart helper batch files automate commonly-performed tasks during Ruby on Rails project creation.<br>

*rails_faststart.cmd* <br>
1. <q>rails new %1</q> is issued, creating a new rails project.<br>
2. The project's Gemfile is appended with the names of your favorite gems.<br>
3. <q>bundle install</q> is issued.<br>
4. Any custom 'rails g ...' commands are issued to finalize gem installs. This will depend on the gems
that are included.<br>

*rails_mygems.cmd* <br>
1. The project's Gemfile is appended with the names of your favorite gems.<br>
2. <q>bundle install</q> is issued.<br>
3. Any custom 'rails g ...' commands are issued to finalize gem installs. This will depend on the gems
that are included.<br>

## Syntax

From the directory immediately above where you want the new rails project to be installed,
issue the command: <br>
&nbsp;&nbsp;&nbsp;&nbsp; <q>rails_faststart NAME_OF_YOUR_PROJECT</q><br>

OR from within an existing project's root folder: <br>
&nbsp;&nbsp;&nbsp;&nbsp; <q>rails_mygems"</q><br>

*Example*<br>

You want to create a new rails project called 'foo' in the c:/sw/rails_projects directory and install your favorite gems:<br>
1. From the command line, navigate to c:/sw/rails_projects<br>
2. Issue the command: <q>rails_faststart foo</q><br>

A project called foo already exists. You want to append your favorite gems into the Gemfile:<br>
1. From the command line, navigate to c:/sw/rails_projects/foo<br>
2. Issue the command: <q>rails_mygems</q><br>

## Caveats

1. The batch files must be located somewhere in the system path.<br>

2. Any gems that are listed in the file must have already been installed on your system via 'gem install ....'. Of course, you could include the gem install commands as part of this bat file.

3. If the gem definition in Gem file requires the > character, that character must be escaped with the ^ charactger (Windows-OS specific). See lines 18, 19 in the rails_create.cmd for an example of this.<br>

    gem 'google-webfonts-rails', '~^> 0.0.4' >> Gemfile   
