# Extractor Example
#
# Fetch Yahoo! News HK

require "#{File.dirname(__FILE__)}/../lib/fullfeed"
require "#{File.dirname(__FILE__)}/extractors/yahoo_news_hong_kong_extractor"

# fetch news from Yahoo! News HK, at most fetch 20 pages, wait 2 seconds before each try
feed = Fullfeed::Feed.new("http://hk.news.yahoo.com/rss/hongkong/rss.xml",
        :limit => 2,
        :wait => 1,
        :agent => :open_uri)
result = feed.fetch
puts result

File.open("yahoo.rss", "w") do |file|
  file.write(result)
end

