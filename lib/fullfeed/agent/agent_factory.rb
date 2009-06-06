module Fullfeed
  module Agent
    AGENT_MAP = {:mechanize => MechanizeAgent, :open_uri => OpenUriAgent}

    class AgentFactory
      # get HTTP agent by symbol
      # Accetable agents:
      #  # :open_uri  - simplistic HTTP client
      #  # :mechanize - full feature HTTP client with cookies support
      def self.agent(name = :open_uri)
        agent_class = AGENT_MAP[name]
        if agent_class
          agent = agent_class.new

          if agent.is_a?(BaseAgent)
            return agent
          end
        end
        return nil
      end
    end
  end
end