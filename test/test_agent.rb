#!/usr/bin/env ruby

require 'test/unit'
require "#{File.dirname(__FILE__)}/../lib/fullfeed"
require 'load_files'

class TestAgent < Test::Unit::TestCase
  def test_agent_factory
    open_uri_agent = Fullfeed::Agent::AgentFactory.instance.agent(:open_uri)
    assert_not_nil open_uri_agent
  end

  def test_openuri_agent
    agent = Fullfeed::Agent::AgentFactory.instance.agent(:open_uri)
    doc = agent.get('http://www.google.com/')
    assert_not_nil(doc.to_s)
  end

  def test_mechanize_agent
    agent = Fullfeed::Agent::AgentFactory.instance.agent(:mechanize)
    doc = agent.get('http://www.google.com/')
    assert_not_nil(doc.to_s)
  end
  
end
