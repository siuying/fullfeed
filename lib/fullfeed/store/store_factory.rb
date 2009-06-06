module Fullfeed
  module Store
    class StoreFactory
      @@stores = { :memory => MemoryStore }

      # only load DbStore if datamapper is installed
      begin
        gem('datamapper', '>= 0.9.7')
        @@stores[:db] = DbStore
      rescue Gem::LoadError
      end

      # get class extends BaseCache from a symbol
      # Accetable name:
      #  # :memory - store result in memory
      def self.store(url, cache_size, name = :memory)
        store_class = @@stores[name]
        
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