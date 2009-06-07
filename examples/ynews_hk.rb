# Extractor Example
#
# create full text RSS feed from Yahoo! News HK

require "rubygems"
require "fullfeed"
require "#{File.dirname(__FILE__)}/extractors/yahoo_news_hong_kong_extractor"

feed = Fullfeed::Feed.new("http://hk.news.yahoo.com/rss/hongkong/rss.xml")
puts feed.fetch


