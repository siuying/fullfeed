require "fullfeed"

module Fullfeed
  module Extractor
    class YahooNewsHongKongExtractor < XpathExtractor
      # register this extractor to the system
      register

      def initialize
        super(%r{http://hk\.rd\.yahoo.com/news/rss/\*http://.+\.html}, ".livewords")
      end
    end
  end
end