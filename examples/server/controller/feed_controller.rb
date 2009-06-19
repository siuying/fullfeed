require '../../lib/fullfeed/filters/translate_filter'

module Fullfeedr
  class FeedController
    CONF = [
            {
                    'name' => "appleactionnews",
                    'url' => "http://rss.appleactionews.com/rss.xml",
                    'filters' => [Fullfeed::Filters::ConvertEncodingFilter.new("UTF-8", "Big5"), Fullfeed::Filters::ExcessSpaceFilter.new]},
            {
                    'name' => "ynews-hk",
                    'url' => "http://hk.news.yahoo.com/rss/hongkong/rss.xml"
            },
            {
                    'name' => "siuying's twitter",
                    'url' => "http://twitter.com/statuses/user_timeline/2017551.rss",
                    'filters' => Fullfeed::Filters::TranslateFilter.new
            }
    ].freeze

    def initialize
      @feeds = {}
      CONF.each do |conf|
        name = conf['name']
        url = conf['url']
        filters = conf['filters'] || []

        @feeds[name] = Fullfeed::Feed.new(url,
          :limit => 2,
          :wait => 1,
          :filters => filters,
          :agent => :open_uri,
          :store => :memory)
      end
    end

    def fetch(name)
      if @feeds[name]
        @feeds[name].fetch.to_s
      else
        raise ArgumentError, "not a registered name!"
      end
    end

    def list
      CONF
    end
  end
end