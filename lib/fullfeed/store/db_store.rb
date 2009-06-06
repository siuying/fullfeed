require 'dm-core'
require 'dm-timestamps'

module Fullfeed
  module Store
    class DbStore < BaseStore
      def self.setup(url)
        DataMapper.setup(:default, url)
      end

      #Initialize a datamapper store
      def initialize(url, cache_size)
        @url = url
      end

      #Save or update existing item by key
      def []=(key, value)
        item = Item.first_or_new(:feed_url => @url, :guid => key)
        item.content = value
        item.save
        value
      end

      #Retrieve an item by key
      def [](key)
        item = Item.first(:feed_url => @url, :guid => key)
        item.content
      end

    end

    class Item
      include DataMapper::Resource
      property  :id,        Serial
      property  :feed_url,  String
      property  :guid,      String
      property  :content,   String
    end
  end
end

