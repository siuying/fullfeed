module Fullfeed
  module Extractor
    class AppleNewsExtractor < XpathExtractor
      # register this extractor to the system
      register

      def initialize
        super(%r{www.appleactionews.com}, ".article")
      end
    end
  end
end