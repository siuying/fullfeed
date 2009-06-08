Gem::Specification.new do |s|
  s.specification_version = 2 if s.respond_to? :specification_version=
  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  
  s.name = "fullfeed"
  s.summary = s.description = "Create full text RSS feed from RSS"

  s.author = "siuying"
  s.email = "siu.ying@gmail.com"

  s.version = '0.4.7'
  s.date = '2009-06-09'
  s.platform = Gem::Platform::RUBY
  s.require_path = 'lib'

  # = MANIFEST =
  s.files = %w[
    LICENSE
    README
    Rakefile
    examples/applenews_hk.rb
    examples/extractors/apple_news_extractor.rb
    examples/extractors/yahoo_news_hong_kong_extractor.rb
    examples/server/controller/feed_controller.rb
    examples/server/server.rb
    examples/server/views/index.erb
    examples/sinatra/web.rb
    examples/ynews_hk.rb
    examples/ynews_hk_db.rb
    fullfeed.gemspec
    lib/fullfeed.rb
    lib/fullfeed/agent/agent_factory.rb
    lib/fullfeed/agent/appengine_agent.rb
    lib/fullfeed/agent/base.rb
    lib/fullfeed/agent/mechanize_agent.rb
    lib/fullfeed/agent/open_uri_agent.rb
    lib/fullfeed/extractor/base_extractor.rb
    lib/fullfeed/extractor/extractor_factory.rb
    lib/fullfeed/extractor/text_extractor.rb
    lib/fullfeed/extractor/xpath_extractor.rb
    lib/fullfeed/feed.rb
    lib/fullfeed/filters/base_filter.rb
    lib/fullfeed/filters/convert_encoding_filter.rb
    lib/fullfeed/filters/excess_space_filter.rb
    lib/fullfeed/filters/uppercase_filter.rb
    lib/fullfeed/store/base.rb
    lib/fullfeed/store/db_store.rb
    lib/fullfeed/store/memory_store.rb
    lib/fullfeed/store/store_factory.rb
    test/load_files.rb
    test/test_agent.rb
    test/test_store.rb
  ]
  # = MANIFEST =

  s.rubygems_version = '1.1.1'

end
