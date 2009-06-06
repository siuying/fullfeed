# Extractor Example
#
# create full text RSS feed from Yahoo! News HK

require "#{File.dirname(__FILE__)}/../lib/fullfeed"
require "#{File.dirname(__FILE__)}/extractors/yahoo_news_hong_kong_extractor"

# create full text RSS feed from Yahoo! News HK
# At most fetch 20 pages, wait 1 seconds before each try
feed = Fullfeed::Feed.new("http://hk.news.yahoo.com/rss/hongkong/rss.xml",
        :limit => 20,
        :wait => 1)
result = feed.fetch
puts result

File.open("yahoo.rss", "w") do |file|
  file.write(result)
end

