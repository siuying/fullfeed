require 'open-uri'

module Fullfeed
  module Agent
    #Use open-uri as the agent
    #Simplistic but work
    class OpenUriAgent < BaseAgent
      def get(url)
        open(url, "User-Agent" => "Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; zh-TW; rv:1.9.0.10) Gecko/2009042315 Firefox/3.0.10")        
      end
    end
  end
end