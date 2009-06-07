require "#{File.dirname(__FILE__)}/store/base"
require "#{File.dirname(__FILE__)}/store/store_factory"
require "#{File.dirname(__FILE__)}/store/memory_store"

# only load DbStore if datamapper is installed
begin
  gem('datamapper', '>= 0.9.7')
  require "#{File.dirname(__FILE__)}/store/db_store"
rescue Gem::LoadError
end

