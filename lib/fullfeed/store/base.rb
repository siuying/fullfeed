module Fullfeed
  module Store
    class BaseStore
      def initialize(url, cache_size)
      end
      
      def self.register
        StoreFactory.instance.register(self)
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