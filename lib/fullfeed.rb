require 'rubygems'
require 'nokogiri'
require 'hpricot'
require 'logger'

require "#{File.dirname(__FILE__)}/fullfeed/feed"

require "#{File.dirname(__FILE__)}/fullfeed/extractor/extractor_factory"
require "#{File.dirname(__FILE__)}/fullfeed/extractor/base_extractor"
require "#{File.dirname(__FILE__)}/fullfeed/extractor/text_extractor"

