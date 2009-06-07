require 'iconv'

module Fullfeed
  module Filters
    # convert feed to UTF-8 encoding
    class ConvertEncodingFilter < BaseFilter
      def initialize(feed_encoding, item_encoding)
        @feed_encoding = feed_encoding
        @item_encoding = item_encoding
      end

      # run before rss is processed
      def before_doc(feed)
        Iconv.conv("UTF-8//IGNORE", @feed_encoding, feed)
      end

      # run after process the item node
      def after_item(item)
        Iconv.conv("UTF-8//IGNORE", @item_encoding, item)
      end
    end
  end
end