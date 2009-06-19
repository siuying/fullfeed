require 'rubygems'
gem('datamapper', '>=0.9.7')

require 'dm-core'
require 'dm-timestamps'

module Fullfeed
  module Store
    class DbStore < BaseStore
      register
      
      def self.setup(url, automigrate = false)
        DataMapper.setup(:default, url)
        begin
          Item.first
        rescue
          DataMapper.auto_migrate!
        end
      end

      #Initialize a datamapper store
      def initialize(url, cache_size)
        @url = url
      end

      #Save or update existing item by key
      def []=(key, value)
        item = Item.first_or_create(:feed_url => @url, :guid => key)
        item.content = value
        item.save
        value
      end

      #Retrieve an item by key
      def [](key)
        item = Item.first(:feed_url => @url, :guid => key)       
        item.content rescue nil
      end

    end

    class Item
      include DataMapper::Resource
      property  :id,        Serial
      property  :feed_url,  String
      property  :guid,      String
      property  :content,   Text
    end
  end
end

