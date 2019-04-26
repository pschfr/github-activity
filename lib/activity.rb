# Require the gems used in this file
require 'dotenv/load'

# Require standard Ruby methods
require 'rss'
require 'open-uri'

# Requests activity from GitHub!
module GitHubActivity
  # My constants
  USERNAME = 'pschfr'.freeze
  FEED_URI = "https://github.com/#{USERNAME}.private.atom?token=#{ENV['FEED_TOKEN']}".freeze # rubocop:disable LineLength

  # Gets all the activity
  def self.all
    # Open the feed...
    open(FEED_URI) do |rss| # rubocop:disable Open
      # then parse the RSS and return it
      RSS::Parser.parse(rss)
    end
  end
end
