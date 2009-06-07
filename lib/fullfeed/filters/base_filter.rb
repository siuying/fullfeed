module Fullfeed
  module Filters
    class FilterChain
      def initialize(filters)
        filters = [filters] unless filters.is_a? Array
        @filters = filters
      end

      def before_doc(doc)
        run_filters(@filters, :before_doc, doc)
      end

      def after_doc(doc)
        run_filters(@filters, :after_doc, doc)
      end

      def before_item(item)
        run_filters(@filters, :before_item, item)
      end
      
      def after_item(item)
        run_filters(@filters, :after_item, item)
      end

      private
      def run_filters(filters, method, target)
        filters.each do |f|
          target = f.send(method.to_sym, target)
        end
        target
      end
    end


    class BaseFilter
      # run before rss is processed
      # doc is html text, should also return html text
      def before_doc(doc)
        doc
      end
      
      # run after rss is processed
      # doc is a Hpricot document, should also return a document
      def after_doc(doc)
        doc
      end

      # run before the item is processed
      # item is HTML text, should also return html text
      def before_item(item)
        item
      end

      # run after the item is processed
      # item is HTML text, should also return html text
      def after_item(item)
        item
      end
    end
  end
end