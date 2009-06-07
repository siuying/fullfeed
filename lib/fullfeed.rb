path = File.expand_path(File.dirname(__FILE__))
$:.unshift(path) unless $:.include?(path)

require 'logger'

require "fullfeed/agent/base"
require "fullfeed/agent/agent_factory"
require "fullfeed/agent/open_uri_agent"

begin
  # optionally require mechanize
  gem('mechanize')
  require "fullfeed/agent/mechanize_agent"
rescue Gem::LoadError
end
begin
  # optionally require appengine-api
  gem('appengine-apis')
  require "fullfeed/agent/appengine_agent"
rescue Gem::LoadError
rescue NameError
end

require "fullfeed/extractor/extractor_factory"
require "fullfeed/extractor/base_extractor"
require "fullfeed/extractor/text_extractor"
require "fullfeed/extractor/xpath_extractor"


require "fullfeed/filters/base_filter"
require "fullfeed/filters/convert_encoding_filter"
require "fullfeed/filters/uppercase_filter"
require "fullfeed/filters/uppercase_filter"


require "fullfeed/store/base"
require "fullfeed/store/store_factory"
require "fullfeed/store/memory_store"

# only load DbStore if datamapper is installed
begin
  gem('datamapper', '>= 0.9.7')
  require "fullfeed/store/db_store"
rescue Gem::LoadError
end

require "fullfeed/feed"