gem('appengine-apis')
require 'appengine-apis/urlfetch'

module Fullfeed
  module Agent
    class AppengineAgent < BaseAgent
      include AppEngine::URLFetch
      register

      def initialize
        @logger = AppEngine::Logger.new
      end

      def get(url)
        @logger.info "download link: #{url}"
        result = fetch(url)
        result.urlfetch_body rescue result.body
      end
    end
  end
end