require 'iconv'

module Fullfeed
  module Filters
    # convert feed to UTF-8 encoding
    class UppercaseFilter < BaseFilter
      def initialize
      end

      # run before rss is processed
      def before_doc(feed)
        feed.upcase
      end

      # run after process the item node
      def after_item(item)
        item.upcase
      end
    end
  end
end