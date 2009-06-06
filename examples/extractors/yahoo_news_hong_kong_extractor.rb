module Fullfeed
  module Extractor
    class YahooNewsHongKongExtractor < XpathExtractor
      register_extractor

      ACCEPT_URLS_PATTERN = [
              /^http:\/\/hk.rd.yahoo.com\/news\/rss\/\*http:\/\/hk.news.yahoo.com\/article\/.+\.html$/,
              /^http:\/\/hk\.news\.yahoo\.com\/article\/.+\.html$/
      ]

      def initialize
        super(ACCEPT_URLS_PATTERN, ".livewords")
      end
    end
  end
end