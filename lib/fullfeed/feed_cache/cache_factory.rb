module Fullfeed
  module FeedCache
    CACHE_MAP = {:memory => MemoryCache}

    class CacheFactory
      # get class extends BaseCache from a symbol
      # Accetable name:
      #  # :memory - store result in memory
      def self.cache(cache_size, name = :memory)
        cache_class = CACHE_MAP[name]
        
        if cache_class
          cache = cache_class.new(cache_size)
          if cache.is_a?(BaseCache)
            return cache
          end
        end
        return nil
      end
    end
  end
end