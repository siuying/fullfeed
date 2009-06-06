module Fullfeed
  module Store
    STORES = { :memory => MemoryStore, :db => DbStore }

    class StoreFactory
      # get class extends BaseCache from a symbol
      # Accetable name:
      #  # :memory - store result in memory
      def self.store(url, cache_size, name = :memory)
        store_class = STORES[name]
        
        if store_class
          if !cache_size || cache_size <= 0
            raise ArgumentError, "invalid store size: #{cache_size}"
          end

          store = store_class.new(url, cache_size)
          if store.is_a?(BaseStore)
            return store
          end
        end

        raise ArgumentError, "unknown store name :#{name}"
      end
    end
  end
end