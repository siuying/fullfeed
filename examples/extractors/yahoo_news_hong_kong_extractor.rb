module Fullfeed
  module Extractor
    class YahooNewsHongKongExtractor < XpathExtractor
      register_extractor

      def initialize
        super(%r{http://hk\.rd\.yahoo.com/news/rss/\*http://.+\.html}, ".livewords")
      end
    end
  end
end