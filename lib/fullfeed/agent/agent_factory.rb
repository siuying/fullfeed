require 'singleton'

module Fullfeed
  module Agent
    class AgentFactory
      include Singleton

      def initialize
        @agents = {}
      end

      def register(clazz)
        name = to_symbol_name(clazz.name)
        @agents[name.to_sym] = clazz
      end

      # get HTTP agent by symbol
      # Accetable agents:
      #  # :open_uri  - simplistic HTTP client
      #  # :mechanize - full feature HTTP client with cookies support
      def agent(name = :open_uri)
        agent_class = @agents[name]
        if agent_class
          agent = agent_class.new

          if agent.is_a?(BaseAgent)
            return agent
          end
        end

        raise ArgumentError, "unknown agent name :#{name}, accepatable: #{@agents.keys.inspect}"
      end

      def self.agent(name = :open_uri)
        instance.agent(name)
      end

      private
      #input:  a full class name
      #output: the class name lowercased, underscore separated,
      #and removed "_agent" at last part
      #e.g. "Fullfeed::Agent::MechanizeAgent" => "mechanize" 
      def to_symbol_name(class_name)
        class_name.
            split("::").
            last.
            gsub(/(.)([A-Z])/, '\1_\2').
            downcase.
            gsub(/_agent$/, '')
      end
    end
  end
end