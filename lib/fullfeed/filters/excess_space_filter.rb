require 'iconv'

module Fullfeed
  module Filters
    # remove spaces between two chinese text, such as appledaily action news pages
    class ExcessSpaceFilter < BaseFilter
      def initialize
      end

      # run after process the item node
      def after_item(item)
        item.gsub(/([^a-zA-Z0+9]) /, '\1')
      end
    end
  end
end