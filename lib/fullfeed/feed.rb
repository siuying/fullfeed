require 'rubygems'
gem('hpricot',    '>= 0.6.1')
require 'hpricot'

require "#{File.dirname(__FILE__)}/agent"
require "#{File.dirname(__FILE__)}/extractor"
require "#{File.dirname(__FILE__)}/store"

module Fullfeed
  class Feed  
    attr_reader :url, :encoding, :xml, :item_limit, :store
    attr_accessor :logger

    def initialize(url, options = {})
      @url            = url
      @encoding       = options[:encoding]  || "UTF-8" 
      @wait           = options[:wait]      || 1
      @item_limit     = options[:limit]     || 50
      @agent_name     = options[:agent]     || :open_uri
      @store_name     = options[:store]     || :memory

      validate_params

      @logger = Logger.new(STDOUT)
      @agent  = Fullfeed::Agent::AgentFactory.agent(@agent_name)
      @store  = Fullfeed::Store::StoreFactory.store(@url, @item_limit, @store_name)
    end


    #Fetch the RSS feed.
    #
    #For each item in the feed, extract the content of the link and replace the description with it.
    #Extraction is based on registered Extractor, check the extractor classes for more information.
    def fetch
      @logger.info "Fetch RSS URL: #{@url}"
      doc = @agent.get(@url)
      doc = to_utf8(doc)
      @xml = Hpricot.XML(doc)
      items = (@xml/"//item")

      @logger.info "Process elements of RSS (count=#{items.size}, limit=#{@item_limit})"
      items.to_a.first(@item_limit).each do |item|
        process_item(item)
      end

      @xml
    end

    private
    def validate_params
      if @wait <= 0
        raise ArgumentError, "invalid wait `#{@wait}'"
      end
      if @item_limit <= 0
        raise ArgumentError, "invalid limit `#{@item_limit}'"
      end
    end

    def process_item(item)
      link = (item/"link").first.inner_text   rescue nil
      desc = (item/"description").first       rescue nil
      guid = (item/"guid").first.inner_text   rescue link

      if link && desc
        begin
          @logger.debug "  Extract item (#{guid}) link: #{link}"
          desc.inner_html = extract_cached(guid, link)
        rescue StandardError => e
          @logger.error "Error fetching content: #{e.inspect}"
        end

      else
        @logger.warn "No link or desc node found in item: #{item}"

      end
    end

    # read cache or fetch result
    def extract_cached(guid, link)
      @store[guid] ||= extract(link)
    end

    #Use ExtractorFactor to find a suitable Extractor, if found, extract supplied link to the URL.
    #If not found, use TextExtractor which extract all text from the page.
    def extract(link)
      extractor = Extractor::ExtractorFactory.instance.extractor(link)

      begin
        unless extractor.nil?
          @logger.debug "  Download link: #{link}"
          doc = @agent.get(link)
          doc = to_utf8(doc)
          return extractor.extract(doc)
        else
          return nil
        end

      ensure
        @logger.debug "  Wait #{@wait} seconds before next URL"
        sleep(@wait) if @wait > 0

      end
    end

    def to_utf8(text)
      if @encoding == "UTF-8"
        text
      else
        Iconv.conv("UTF-8", @encoding, text)
      end
    end
  end
end