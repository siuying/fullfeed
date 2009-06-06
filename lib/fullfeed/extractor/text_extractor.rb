module Fullfeed
  module Extractor
    # extract all text from html. this is being use if no other extractor is suitable
    class TextExtractor < BaseExtractor
      PATTERN = [/^http\:.+$/, /^https\:.+$/]

      def accept(url)
        is_matched?(url, PATTERN)
      end

      # extract a html document, return the content text
      def extract(doc)
        hdoc = Hpricot(doc)        
        text = (hdoc/"//body").inner_text rescue nil
      end
    end
  end
end