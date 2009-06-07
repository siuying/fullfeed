#!/usr/bin/env ruby

require 'test/unit'
require "#{File.dirname(__FILE__)}/../lib/fullfeed"
require 'load_files'

class TestDbStore < Test::Unit::TestCase
  Fullfeed::Store::DbStore.setup("sqlite3:ynews.sqlite3")
  
  def test_store
    store = Fullfeed::Store::StoreFactory.store('http://test', 100, :db)

    value = rand().to_s
    store['/100'] = value
    assert_equal store['/100'], value

    value = "中文測試"
    store['/200'] = value
    assert_equal store['/200'], value
  end
end
