module Fullfeed
  module Agent
    # All agent should implement one method: get
    class BaseAgent
      def self.register
        Fullfeed::Agent::AgentFactory.instance.register(self)
      end

      def get(url)
        raise "Must override get(url)"
      end
    end
  end
end