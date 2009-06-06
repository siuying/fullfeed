require 'rubygems'
gem('ruby-cache', '>= 0.3.0')

require 'cache'

module Fullfeed
  module Store
    #Cache in memory, based on Ruby Cache gem
    class MemoryStore < BaseStore
      def initialize(url, cache_size)
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