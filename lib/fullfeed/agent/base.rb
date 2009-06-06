module Fullfeed
  module Agent
    # All agent should implement one method: get
    class BaseAgent
      def get(url)
        raise "Must override get(url)"
      end
    end
  end
end