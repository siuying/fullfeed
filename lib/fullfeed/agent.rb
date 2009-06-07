require "#{File.dirname(__FILE__)}/agent/base"
require "#{File.dirname(__FILE__)}/agent/agent_factory"
require "#{File.dirname(__FILE__)}/agent/open_uri_agent"

begin
  # optionally require mechanize
  gem('mechanize')
  require "#{File.dirname(__FILE__)}/agent/mechanize_agent"
rescue Gem::LoadError
end



begin
  # optionally require appengine-api
  gem('appengine-apis')
  require "#{File.dirname(__FILE__)}/agent/appengine_agent"
rescue Gem::LoadError
end