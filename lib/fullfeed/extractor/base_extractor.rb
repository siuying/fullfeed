require 'singleton'

module Fullfeed
  module Extractor    
    class BaseExtractor
      include Singleton
      
      #If this extractor accept this url, if true, use it to parse the page
      def accept(url)
        false
      end

      # extract text from html document, return the content
      def extract(doc)
        nil
      end

      def self.register_extractor
        ExtractorFactory.instance.register(self.instance)
      end

      #Check if url matches one of the supplied regexps
      def matched_regexps(url, regexps = [])
        regexps.each do |rexexp|          
          return true if url =~ rexexp
        end
        return false
      end

    end
  end
end