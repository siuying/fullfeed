require 'mechanize'

module Fullfeed
  class Fullfeed  
    attr_reader :url, :encoding, :xml, :item_limit
    attr_accessor :logger

    def initialize(url, options = {})
      @url            = url
      @encoding       = options[:encoding]  || nil
      @wait           = options[:wait]      || 1
      @item_limit     = options[:limit]     || 50
      @logger         = Logger.new(STDOUT)

      @agent          = WWW::Mechanize.new
      @agent.user_agent_alias = "Mac FireFox"
    end

    #Fetch the RSS feed.
    #
    #For each item in the feed, extract the content of the link and replace the description with it.
    #Extraction is based on registered Extractor, check the extractor classes for more information.
    def fetch
      @logger.info "Fetch RSS URL: #{@url}"
      doc = @agent.get(@url)

      @xml = Nokogiri::XML(doc.content, nil, @encoding)
      items = (@xml/"//item")

      @logger.info "Process elements of RSS (count=#{items.size}, limit=#{@item_limit})"
      items.to_a.first(@item_limit).each do |item|
        process_item(item)

        @logger.debug "  Wait #{@wait} seconds before next URL"
        sleep(@wait) if @wait > 0
      end

      @xml
    end

    private    
    def process_item(item)
      link = (item/"link").first.inner_text   rescue nil
      desc = (item/"description").first       rescue nil
      guid = (item/"guid").first.inner_text   rescue link

      if link && desc
        begin 
          @logger.debug "  Extract item (#{guid}) link: #{link}"
          desc.content = extract_cached(guid, link)
        rescue Exception => e
          @logger.error "Error fetching content: #{e.inspect}"
        end

      else
        @logger.warn "No link or desc node found in item: #{item}"

      end
    end
    
    def extract_cached(guid, link)
      # read cache or fetch result      
      text = extract(link) 
    end
    
    #Use ExtractorFactor to find a suitable Extractor, if found, extract supplied link to the URL.
    #If not found, use TextExtractor which extract all text from the page.
    def extract(link)
      extractor = Extractor::ExtractorFactory.instance.extractor(link)

      unless extractor.nil?
        doc = @agent.get(link)
        extractor.extract(doc.content)
      else
        nil
      end
    end
  end
end