require 'singleton'

module Fullfeed
  module Extractor
    class ExtractorFactory
      include Singleton

      def initialize
        @extractors = []
      end

      def register(extractor)
        if !extractor.is_a?(BaseExtractor) || extractor.class == BaseExtractor
          raise "must be subclass of BaseExtractor"
        end
        @extractors << extractor
      end

      def unregister(extractor)
        @extractors.delete(extractor)
      end

      def extractor(url)
        extractors = @extractors.select() {|e| e.accept(url) }
        return extractors.first if extractors.size > 0
        
        # if no extractors accept the above URL, use default TextExtractor
        default = TextExtractor.instance
        return default if default.accept(url)
        return nil
      end
    end

  end
end