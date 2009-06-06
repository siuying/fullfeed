module Fullfeed
  module Extractor
    class YahooNewsHongKongExtractor < BaseExtractor
      register_extractor

      ACCEPT_URLS_PATTERN = [
              /^http:\/\/hk.rd.yahoo.com\/news\/rss\/\*http:\/\/hk.news.yahoo.com\/article\/.+\.html$/,
              /^http:\/\/hk\.news\.yahoo\.com\/article\/.+\.html$/
      ]

      def accept(url)
        matched_regexps(url, ACCEPT_URLS_PATTERN)
      end

      # return content of Yahoo News HK page
      def extract(doc)
        hdoc = Hpricot(doc)        
        text = (hdoc/".livewords").inner_html rescue nil
      end
    end
  end
end