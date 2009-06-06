module Fullfeed
  module Extractor
    # extract all text from html. this is being use if no other extractor is suitable
    class TextExtractor < BaseExtractor
      def accept(url)
        url =~ /^http\:.+$/ || url =~ /^https\:.+$/ 
      end

      # extract a html document, return the content text
      def extract(doc)
        hdoc = Hpricot(doc)        
        text = (hdoc/"//body").inner_text rescue nil
      end
    end
  end
end