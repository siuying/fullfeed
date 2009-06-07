# Extractor Example
#
# create full text RSS feed from Yahoo! News HK

require "#{File.dirname(__FILE__)}/../lib/fullfeed"
require "#{File.dirname(__FILE__)}/extractors/apple_news_extractor"

# convert encoding filer, convert feed and/or fulltext item to UTF-8
# first parameter specify the source RSS Feed encoding
# second parameter specify the fulltext item HTML page encoding
filter = Fullfeed::Filters::ConvertEncodingFilter.new("UTF-8", "Big5")

# create full text RSS feed from Yahoo! News HK
# At most fetch 5 pages, wait 1 seconds before each try
feed = Fullfeed::Feed.new("http://rss.appleactionews.com/rss.xml",
        :limit => 5,
        :agent => :open_uri,
        :filters => filter,
        :wait => 1)
result = feed.fetch
puts result

File.open("apple.rss", "w") do |file|
  file.write(result)
end

