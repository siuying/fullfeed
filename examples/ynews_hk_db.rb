# Extractor Example, using Datamapper
#
# Create full text RSS feed from Yahoo! News HK, store RSS in datamapper.
# Later invocation will not cause older items being download again.
# Use sqlite3 as backend, use proper adapter for your needs!
#
# Uncomment the line under "Migrate database" when first run this app (it setup database)
#

require "#{File.dirname(__FILE__)}/../lib/fullfeed"
require "#{File.dirname(__FILE__)}/extractors/yahoo_news_hong_kong_extractor"

# setup datamaper
Fullfeed::Store::DbStore.setup("sqlite3:ynews.sqlite3")

# Migrate database, use only once
#DataMapper.auto_migrate!

# create full text RSS feed from Yahoo! News HK
# At most fetch 20 pages, wait 1 seconds before each try
feed = Fullfeed::Feed.new("http://hk.news.yahoo.com/rss/hongkong/rss.xml",
        :limit => 20,
        :store => :db,
        :wait => 1)
result = feed.fetch
puts result

File.open("yahoo.rss", "w") do |file|
  file.write(result)
end