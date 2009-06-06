# Web Example
#
# Start a web server that host the Yahoo! Hong Kong news with full text feed
# Require sinatra gem

require 'rubygems'
require 'sinatra'

require "#{File.dirname(__FILE__)}/../../lib/fullfeed"
require "#{File.dirname(__FILE__)}/../extractors/yahoo_news_hong_kong_extractor"

# fetch news from Yahoo! News HK, at most fetch 20 pages, wait 2 seconds before each try
feed = Fullfeed::Feed.new("http://hk.news.yahoo.com/rss/hongkong/rss.xml",
        :limit => 20,
        :wait => 1,
        :agent => :open_uri)

# pre fetch the request
feed.logger.info "Pre-Fetching RSS, could take some time ..."
feed.fetch

get '/' do
  # fetch updated item
  feed.fetch.to_s
end
