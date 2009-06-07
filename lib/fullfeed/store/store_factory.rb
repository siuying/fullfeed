module Fullfeed
  module Store
    class StoreFactory
      include Singleton

      def initialize
        @stores = {}
      end

      #register a Store to the StoreFactory
      def register(clazz)
        name = to_symbol_name(clazz.name)
        @stores[name.to_sym] = clazz
      end

      # get class extends BaseCache from a symbol
      # Accetable name:
      #  # :memory - store result in memory
      #  # :db     - store result in database (require DataMapper)
      def store(url, cache_size, name = :memory)
        store_class = @stores[name]
        
        if store_class
          if !cache_size || cache_size <= 0
            raise ArgumentError, "invalid store size: #{cache_size}"
          end

          store = store_class.new(url, cache_size)
          if store.is_a?(BaseStore)
            return store
          end
        end

        raise ArgumentError, "unknown store name :#{name}, accepatable: #{@stores.keys.inspect}"
      end

      #see instance method store
      def self.store(url, cache_size, name = :memory)
        instance.store(url, cache_size, name)
      end

      private
      #input:  a full class name
      #output: the class name lowercased, underscore separated,
      #and removed "_store" at last part
      #e.g. "Fullfeed::Store::MemoryStore" => "memory"
      def to_symbol_name(class_name)
        class_name.
            split("::").
            last.
            gsub(/(.)([A-Z])/, '\1_\2').
            downcase.
            gsub(/_store$/, '')
      end
    end
  end
end