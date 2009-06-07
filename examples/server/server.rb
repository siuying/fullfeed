# Web Example
#
# Start a web server that host the Yahoo! Hong Kong news with full text feed
# Require sinatra gem

require 'rubygems'
require 'sinatra'
require 'erb'
require "#{File.dirname(__FILE__)}/../../lib/fullfeed"
require "#{File.dirname(__FILE__)}/../extractors/yahoo_news_hong_kong_extractor"
require "#{File.dirname(__FILE__)}/../extractors/apple_news_extractor"
require 'controller/feed_controller'

# setup
Fullfeed::Store::DbStore.setup("sqlite3:ynews.sqlite3", true)
server = Fullfeedr::FeedController.new

# list feeds
get '/' do
  @list = server.list
  erb :index
end

# fetch pages
get '/:name' do
  server.fetch(params[:name])
end