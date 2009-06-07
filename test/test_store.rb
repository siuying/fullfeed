#!/usr/bin/env ruby

require 'test/unit'
require "#{File.dirname(__FILE__)}/../lib/fullfeed"
require 'load_files'

class TestDbStore < Test::Unit::TestCase
  Fullfeed::Store::DbStore.setup("sqlite3:ynews.sqlite3")

  def test_db_store
    store = Fullfeed::Store::StoreFactory.store('http://test', 100, :db)
    base_test_store(store)
  end

  def test_memory_store
    store = Fullfeed::Store::StoreFactory.store('http://test', 100, :memory)
    base_test_store(store)
  end
  private
  def base_test_store(store)

    value = rand().to_s
    store['/100'] = value
    assert_equal store['/100'], value

    value = "中文測試"
    store['/200'] = value
    assert_equal store['/200'], value
  end
end
