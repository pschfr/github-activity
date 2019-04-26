# Requires gems from vendor/bundle instead of global PATH
require 'bundler/setup'

# Require the gems used in this file
require 'dotenv/load'
require 'sinatra'

# Require standard Ruby methods
require 'rss'
require 'open-uri'

# My constants
USERNAME = 'pschfr'.freeze
FEED_URI = "https://github.com/#{USERNAME}.private.atom?token=#{ENV['FEED_TOKEN']}".freeze # rubocop:disable LineLength

# This is run on Sinatra initialization
configure do
  # Open the feed...
  open(FEED_URI) do |rss| # rubocop:disable Open
    # and parse the RSS
    feed = RSS::Parser.parse(rss)
    # Sets the feed to a global settings value
    set :activity, feed
  end
end

# On '/' page, do this...
get '/' do
  # Render index page template
  erb :index
end
