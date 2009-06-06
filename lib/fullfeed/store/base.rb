module Fullfeed
  module Store
    class BaseStore
      def initialize(url, cache_size)
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