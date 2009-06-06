module Fullfeed
  module FeedCache
    class BaseCache
      def initialize(cache_size)
      end

      def []=(args)
        raise "Must override []="
      end

      def [](args)
        raise "Must override []"
      end

    end
  end
end