# Requires gems from vendor/bundle instead of global PATH
require 'bundler/setup'

# Require the gems used in this file
require 'sinatra'

# Require my library files
require_relative 'lib/activity'

# On '/' page, do this...
get '/' do
  # Return all the recent GitHub Activity to the page
  @activity = GitHubActivity.all
  # Render index page template
  erb :index
end
