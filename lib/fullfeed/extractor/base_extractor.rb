require 'singleton'

module Fullfeed
  module Extractor
    module ExtractorHelper
      #If the url matched the RegExp(s).
      #  # url - a string
      #  # regexps - an Array of RegExp, or a RegExp
      def is_matched?(url, regexps)
        regexps = [regexps] unless regexps.is_a? Array
        regexps.each do |rexexp|
          return true if url =~ rexexp
        end
        return false
      end
    end

    class BaseExtractor
      include Singleton
      include ExtractorHelper
      
      #If this extractor accept this url, if true, use it to parse the page
      def accept(url)
        false
      end
      
      # extract text from html document, return the content
      def extract(doc)
        nil
      end

      def self.register_extractor
        ExtractorFactory.instance.register(self)
      end
    end
  end
end