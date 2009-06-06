require 'mechanize'

module Fullfeed
  module Agent
    #Use Mechanize as the agent
    #Support cookies ... etc
    class MechanizeAgent < BaseAgent
      def initialize
        @agent = WWW::Mechanize.new
        @agent.user_agent_alias = "Mac FireFox"   
      end

      def get(url)
        page = @agent.get(url)
        page.content
      end
    end
  end
end