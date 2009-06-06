module Fullfeed
  module Extractor
    class XpathExtractor < BaseExtractor
      attr_reader :xpath, :pattern

      def initialize(pattern = nil, xpath = nil)
        @pattern = pattern
        @xpath = xpath
      end

      def accept(url)
        is_matched?(url, @pattern)
      end

      # return content of Yahoo News HK page
      def extract(doc)
        hdoc = Hpricot(doc)
        text = (hdoc.search(@xpath)).inner_html rescue nil
      end

    end
  end
end