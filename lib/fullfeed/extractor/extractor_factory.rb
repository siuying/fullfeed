require 'singleton'

module Fullfeed
  module Extractor
    class ExtractorFactory
      include Singleton

      def initialize
        @extractors = []
      end

      def register(extractor_class)
        @extractors << extractor_class
      end

      def unregister(extractor)
        @extractors.delete(extractor)
      end

      def extractor(url)
        extractors = @extractors.select() {|e| e.instance.accept(url) }
        return extractors.first.instance if extractors.size > 0
        
        # if no extractors accept the above URL, use default TextExtractor
        default = TextExtractor.instance
        return default if default.accept(url)
        return nil
      end
    end

  end
end