require 'cache'

module Fullfeed
  module FeedCache
    #Cache in memory, based on Ruby Cache gem
    class MemoryCache < BaseCache
      def initialize(cache_size)
        @cache = Cache.new({:max_num => cache_size})
      end

      def []=(key, value)
        @cache[key] = value
      end

      def [](key)
        @cache[key]
      end

    end
  end
end