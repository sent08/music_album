music_album
===========

Sample application Using Rails3.0.1, Paperclip, Rspec, Capybara and Factorygirl

Developed Environment:
---------------------------
Rails: 3.0.1
Ruby: 1.8.7 (2010-01-10 patchlevel 249)
Gem: 1.3.6
DB: MYSQL
OS: Windows7

----------------------------------------------------------------------------------
Important Note: Add database.yml in to your configuration folder with myql adapter
----------------------------------------------------------------------------------

Pre-requisites:
-------------------------------
Imagemagick package


Execute the following command to test the app
---------------------------------------------
bundle install

rake db:create

rake db:migrate
rake db:migrate RAILS_ENV=test

bundle exec rspec


Music Album Upload:
------------------
Album files and cover photos upload are achieved through Paperclip with Rmagick

