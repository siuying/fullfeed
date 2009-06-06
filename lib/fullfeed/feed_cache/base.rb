module Fullfeed
  module FeedCache
    class BaseCache
      def initialize()
        
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